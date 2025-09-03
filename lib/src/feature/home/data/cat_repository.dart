import 'package:app/src/common/api/api_client.dart';
import 'package:app/src/common/api/api_exception.dart';
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
      path: '/v1/breeds${search != null ? '?search=$search' : ''}',
      // Endpoint de la API para obtener la lista de gatos
      fromJson: (json) {
        final userList = json as List<dynamic>;
        return userList
            .map(
              (userJson) => CatModel.fromJson(userJson as Map<String, dynamic>),
            )
            .toList();
      },
    );
  }
}
