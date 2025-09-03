// Clase para encapsular los errores de la API de forma controlada
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final ExceptionType type;

  ApiException({
    this.message = 'Ocurrió un error inesperado.',
    this.statusCode,
    required this.type,
  });

  @override
  String toString() => 'ApiException: [$type] - $message (Status: $statusCode)';
}

// Tipos de errores para identificarlos fácilmente en la UI
enum ExceptionType {
  requestCancelled,
  unauthorisedRequest,
  badRequest,
  notFound,
  methodNotAllowed,
  notAcceptable,
  requestTimeout,
  conflict,
  internalServerError,
  serviceUnavailable,
  noInternetConnection,
  formatException,
  unableToProcess,
  unexpectedError,
}
