// Un ejemplo de tu UserRepository
import 'package:app/src/common/config/api_exception.dart';
import 'package:app/src/common/config/api_request.dart';
import 'package:app/src/feature/home/domain/cat_model.dart';

class CatRepository {
  CatRepository({required this.apiClient});
  final ApiClient apiClient;

  /// Obtiene una lista de todos los gatos desde la API.
  ///
  /// Utiliza el método `get` del ApiClient, especificando que esperamos una
  /// `List<CatModel>`.
  /// La función `fromJson` se encarga de transformar la lista JSON en una
  /// lista de objetos CatModel.
  ///
  /// Lanza una [ApiException] si la petición falla.
  Future<List<CatModel>> getCats({
    String? search,
  }) async {
    return apiClient.get<List<CatModel>>(
      path:
          '/v1/breeds${search != null ? '?search=$search' : ''}', // Endpoint de la API para obtener la lista de usuarios
      fromJson: (json) {
        // El JSON que llega es una List<dynamic>.
        final userList = json as List<dynamic>;

        // Usamos .map para convertir cada elemento de la lista JSON en un
        // objeto CatModel y luego .toList() para convertir el resultado
        // de nuevo en una lista.
        return userList
            .map(
              (userJson) => CatModel.fromJson(userJson as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }
}
