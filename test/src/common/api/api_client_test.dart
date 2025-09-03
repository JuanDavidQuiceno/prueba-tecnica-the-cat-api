import 'package:app/src/common/api/api_client.dart';
import 'package:app/src/common/api/api_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

// 1. Crea mocks para las dependencias externas.
class MockHttpClient extends Mock implements http.Client {}

// Se necesita para el `when` de la llamada a `get` con `any()`
class FakeUri extends Fake implements Uri {}

void main() {
  late ApiClient apiClient;
  late MockHttpClient mockHttpClient;

  setUpAll(() {
    // Necesario para que `any()` funcione con el parámetro Uri
    registerFallbackValue(FakeUri());
  });

  setUp(() {
    mockHttpClient = MockHttpClient();
    // Para el test, podemos pasar una función getToken simple.
    apiClient = ApiClient(
      client: mockHttpClient,
    );
  });

  group('ApiClient Tests -', () {
    // --- Test para ÉXITO 200 OK ---
    test('GET exitoso (200) devuelve un objeto decodificado', () async {
      // ARRANGE
      const fakeJson =
          '{"id": 1, "name": "Test User", "email": "test@test.com"}';

      when(
        () => mockHttpClient.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(fakeJson, 200));

      // ACT
      final result = await apiClient.get<Map<String, dynamic>>(
        path: '/users/1',
        fromJson: (json) => json as Map<String, dynamic>,
      );

      // ASSERT
      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], 1);
      expect(result['name'], 'Test User');
    });

    // --- Test para FALLO 404 Not Found ---
    test('GET fallido (404) lanza una ApiException de tipo notFound', () async {
      // ARRANGE
      when(
        () => mockHttpClient.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      // ACT
      final call = apiClient.get<Map<String, dynamic>>(
        path: '/users/999',
        fromJson: (json) => json as Map<String, dynamic>,
      );

      // ASSERT
      expect(
        call,
        throwsA(
          isA<ApiException>().having(
            (e) => e.type,
            'type',
            ExceptionType.notFound,
          ),
        ),
      );
    });

    // --- Test para la LÓGICA DE REINTENTOS ---
    test(
      'GET fallido (500) reintenta la llamada y luego lanza la excepción',
      () async {
        // ARRANGE
        // Simulamos que el servidor siempre responde con error 500
        when(
          () => mockHttpClient.get(any(), headers: any(named: 'headers')),
        ).thenAnswer((_) async => http.Response('Server Error', 500));

        // ACT
        final call = apiClient.get<Map<String, dynamic>>(
          path: '/some/path',
          fromJson: (json) => json as Map<String, dynamic>,
        );

        // ASSERT
        // Verificamos que al final sí lanza una excepción
        await expectLater(call, throwsA(isA<ApiException>()));

        // La verificación clave: comprobamos que se llamó 2 veces
        // (1 intento + 1 reintento)
        verify(
          () => mockHttpClient.get(any(), headers: any(named: 'headers')),
        ).called(2);
      },
    );
  });
}
