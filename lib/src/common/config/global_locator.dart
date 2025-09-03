import 'package:app/src/common/config/api_request.dart';
import 'package:app/src/feature/home/data/car_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

late GetIt global;

void setUpGlobalLocator() {
  global = GetIt.I;

  // 1. DEPENDENCIAS EXTERNAS
  global
    ..registerLazySingleton<http.Client>(http.Client.new)
    // 2. SERVICIOS DE BAJO NIVEL
    // Imaginemos que tienes un AuthService que guarda y lee el token de forma
    // segura.
    // global.registerLazySingleton<AuthService>(() => AuthService());
    // 3. API CLIENT
    // Ahora registramos nuestro ApiClient. Fíjate cómo "pide" a GetIt las
    // dependencias que necesita.
    ..registerLazySingleton<ApiClient>(
      () => ApiClient(
        // getIt<T>() busca en el contenedor una dependencia ya registrada de
        // tipo T.
        client: global<http.Client>(),

        // Para el `getToken`, creamos una función que resuelve el AuthService y
        // llama a su método para obtener el token. Esto desacopla elegantemente
        // el ApiClient de saber *cómo* se almacena el token.
        // getToken: () async => await global<AuthService>().getToken(),
      ),
    )
    // 4. REPOSITORIOS
    // El UserRepository depende del ApiClient, que ya está registrado.
    ..registerLazySingleton<CatRepository>(
      () => CatRepository(
        apiClient: global<ApiClient>(),
      ),
    );

  // ... aquí registrarías otros repositorios, BLoCs, etc.
}

// T read<T extends Object>() {
//   return global.get<T>();
// }
