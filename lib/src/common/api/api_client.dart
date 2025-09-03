import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app/src/common/api/api_exception.dart';
import 'package:app/src/common/environments.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({
    http.Client? client,
    String? baseUrl,
  }) : _client = client ?? http.Client(),
       _baseUrl = baseUrl ?? Environment.urlApi;
  final http.Client _client;
  final String _baseUrl;

  static const int _attemptLimit = 2;
  static const Duration _timeoutLimit = Duration(seconds: 30);

  /// CAMBIO: El método ahora devuelve Future< T > directamente.
  /// Lanza una [ApiException] en caso de error.
  Future<T> get<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    Map<String, String>? queryParams,
  }) {
    return _request<T>(
      path: path,
      method: 'GET',
      queryParams: queryParams,
      fromJson: fromJson,
    );
  }

  Future<T> post<T>({
    required String path,
    required T Function(dynamic json) fromJson,
    Map<String, String>? queryParams,
    Map<String, dynamic>? body,
  }) {
    return _request<T>(
      path: path,
      method: 'POST',
      queryParams: queryParams,
      body: body,
      fromJson: fromJson,
    );
  }

  // ...otros métodos como put(), delete()...

  Future<T> _request<T>({
    required String path,
    required String method,
    required T Function(dynamic json) fromJson,
    Map<String, String>? queryParams,
    Map<String, dynamic>? body,
  }) async {
    for (var attempt = 1; attempt <= _attemptLimit; attempt++) {
      try {
        final uri = Uri.parse(
          '$_baseUrl$path',
        ).replace(queryParameters: queryParams);
        final headers = await _getHeaders();
        final requestBody = body != null ? json.encode(body) : null;

        final response = await _sendRequest(
          uri: uri,
          method: method,
          headers: headers,
          body: requestBody,
        ).timeout(_timeoutLimit);

        final decodedBody = _handleResponse(response);

        // CAMBIO: En lugar de Right, retornamos el valor directamente.
        return fromJson(decodedBody);
      } on ApiException catch (e) {
        if (attempt == _attemptLimit ||
            e.type != ExceptionType.internalServerError) {
          // CAMBIO: En lugar de Left, ahora lanzamos la excepción.
          rethrow;
        }
        await Future.delayed(const Duration(milliseconds: 500));
      } on TimeoutException {
        if (attempt == _attemptLimit) {
          throw ApiException(type: ExceptionType.requestTimeout);
        }
      } on SocketException {
        if (attempt == _attemptLimit) {
          throw ApiException(type: ExceptionType.noInternetConnection);
        }
      } on FormatException {
        if (attempt == _attemptLimit) {
          throw ApiException(type: ExceptionType.formatException);
        }
      } catch (e) {
        if (attempt == _attemptLimit) {
          // Si no es una de nuestras excepciones controladas, la lanzamos.
          if (e is ApiException) rethrow;
          throw ApiException(
            type: ExceptionType.unexpectedError,
            message: e.toString(),
          );
        }
      }
    }
    // Este código es inalcanzable, pero es necesario para que Dart sepa
    // que siempre se lanza o retorna algo.
    throw ApiException(
      type: ExceptionType.unexpectedError,
      message: 'La solicitud falló después de todos los reintentos.',
    );
  }

  // Los métodos privados _sendRequest, _getHeaders y _handleResponse
  // se mantienen exactamente iguales, ya que _handleResponse ya lanzaba
  // excepciones.
  Future<http.Response> _sendRequest({
    required Uri uri,
    required String method,
    required Map<String, String> headers,
    String? body,
  }) {
    // Usamos un switch en el método (en mayúsculas) para determinar qué llamada
    // http realizar.
    switch (method.toUpperCase()) {
      case 'GET':
        return _client.get(uri, headers: headers);
      case 'POST':
        return _client.post(uri, headers: headers, body: body);
      case 'PUT':
        return _client.put(uri, headers: headers, body: body);
      case 'DELETE':
        return _client.delete(uri, headers: headers, body: body);
      case 'PATCH':
        return _client.patch(uri, headers: headers, body: body);
      default:
        // Si se intenta usar un método no implementado, lanzamos un error de
        // programación.
        throw Exception('Método HTTP no soportado: $method');
    }
  }

  /// Construye los headers para la petición.
  ///
  /// Incluye headers estándar como `Content-Type` y `Accept`.
  /// Además, ejecuta la función `_getToken` para obtener el token de
  ///  autenticación y lo añade a la cabecera `Authorization` si está
  /// disponible.
  Future<Map<String, String>> _getHeaders() async {
    // Ejecutamos la función asíncrona que nos pasaron en el constructor
    // para obtener el token.
    // final token = await _getToken();

    return {
      // Usamos las constantes de `dart:io` para evitar errores de tipeo.
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF--8',
      HttpHeaders.acceptHeader: 'application/json',
    };
  }

  /// Valida la respuesta HTTP y decodifica el cuerpo si es exitosa.
  ///
  /// - Si el `statusCode` está en el rango 200-299, intenta decodificar el
  /// cuerpo JSON.
  /// - Si la decodificación falla, lanza una [ApiException] de tipo
  /// `formatException`.
  /// - Si el `statusCode` indica un error, lanza una [ApiException] con el
  /// tipo correspondiente.
  dynamic _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    // Rango de códigos de estado para respuestas exitosas.
    if (statusCode >= 200 && statusCode < 300) {
      // Algunas respuestas exitosas (ej. 204 No Content) pueden no tener
      // cuerpo.
      if (body.isEmpty) {
        return null;
      }
      try {
        // Decodificamos el cuerpo de la respuesta de String a un objeto
        // Dart (Map o List).
        return json.decode(body);
      } on Exception catch (_) {
        // Si el servidor envía una respuesta exitosa pero el JSON es inválido.
        throw ApiException(
          type: ExceptionType.formatException,
          message: 'Error al decodificar la respuesta JSON.',
        );
      }
    } else {
      // Si la respuesta no fue exitosa, mapeamos el código de estado a un tipo
      // de excepción.
      switch (statusCode) {
        case 400:
          throw ApiException(
            type: ExceptionType.badRequest,
            statusCode: statusCode,
          );
        case 401:
        case 403: // A menudo, 403 (Forbidden) se maneja de la misma manera que
          //401 (Unauthorized).
          throw ApiException(
            type: ExceptionType.unauthorisedRequest,
            statusCode: statusCode,
          );
        case 404:
          throw ApiException(
            type: ExceptionType.notFound,
            statusCode: statusCode,
          );
        case 409:
          throw ApiException(
            type: ExceptionType.conflict,
            statusCode: statusCode,
          );
        case 500:
        case 502: // 502 Bad Gateway
          throw ApiException(
            type: ExceptionType.internalServerError,
            statusCode: statusCode,
          );
        case 503:
          throw ApiException(
            type: ExceptionType.serviceUnavailable,
            statusCode: statusCode,
          );
        default:
          throw ApiException(
            type: ExceptionType.unexpectedError,
            statusCode: statusCode,
          );
      }
    }
  }
}
