import 'package:app/src/common/api/api_exception.dart';
import 'package:app/src/common/api/api_client.dart';
import 'package:app/src/feature/home/data/cat_repository.dart';
import 'package:app/src/feature/home/domain/cat_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// 1. Crea una clase Mock para la dependencia que quieres simular.
class MockApiClient extends Mock implements ApiClient {}

void main() {
  // 2. Declara las variables que usarás en tus tests.
  late CatRepository catRepository;
  late MockApiClient mockApiClient;

  // 3. Usa setUp() para inicializar las variables antes de cada test.
  // Esto asegura que cada test comience con un estado limpio.
  setUp(() {
    mockApiClient = MockApiClient();
    catRepository = CatRepository(apiClient: mockApiClient);
  });

  // 4. Agrupa los tests relacionados con una funcionalidad.
  group('CatRepository Tests -', () {
    // --- Test para el caso de ÉXITO ---
    test('getCats devuelve una lista de Cat en un caso de éxito', () async {
      // ARRANGE (Organizar)
      // Define los datos falsos que esperas que el mock devuelva.
      final fakeCats = <CatModel>[
        CatModel(name: 'Cat Uno'),
        CatModel(name: 'Cat Dos'),
      ];

      // Cuando se llame al método 'get' del mockApiClient con estos parámetros
      // devuelve un Future exitoso con nuestra lista de gatos falsos.
      when(
        () => mockApiClient.get<List<CatModel>>(
          path: '/v1/breeds',
          fromJson: any(named: 'fromJson'),
        ),
      ).thenAnswer((_) async => fakeCats);

      // ACT (Actuar)
      // Llama al método que quieres probar.
      final result = await catRepository.getCats();

      // ASSERT (Afirmar)
      // Comprueba que el resultado es el que esperabas.
      expect(result, isA<List<CatModel>>());
      expect(result.length, 2);
      expect(result.first.name, 'Cat Uno');

      // Adicional: verifica que el método del mock fue llamado exactamente
      // una vez.
      verify(
        () => mockApiClient.get<List<CatModel>>(
          path: '/v1/breeds',
          fromJson: any(named: 'fromJson'),
        ),
      ).called(1);
    });

    // --- Test para el caso de FALLO ---
    test('getCats lanza una ApiException cuando el cliente falla', () async {
      // ARRANGE
      // "Cuando se llame al método 'get' del mockApiClient..."
      // "...entonces lanza una ApiException."
      final fakeException = ApiException(
        type: ExceptionType.notFound,
        message: 'No encontrado',
      );
      when(
        () => mockApiClient.get<List<CatModel>>(
          path: '/v1/breeds',
          fromJson: any(named: 'fromJson'),
        ),
      ).thenThrow(fakeException);

      // ACT
      // Obtenemos una referencia a la llamada de la función que queremos
      // probar.
      final call = catRepository.getCats;

      // ASSERT
      // Verificamos que llamar a esta función lanza una excepción del tipo
      // esperado.
      expect(call, throwsA(isA<ApiException>()));
      verify(
        () => mockApiClient.get<List<CatModel>>(
          path: '/v1/breeds',
          fromJson: any(named: 'fromJson'),
        ),
      ).called(1);
    });
  });
}
