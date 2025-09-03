import 'package:app/flavors.dart';
import 'package:app/src/app.dart';
import 'package:app/src/common/config/global_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorsConfig.appFlavor = FlavorEmun.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  /// inicializar inyección de dependencias
  setUpGlobalLocator();
  // Bloc.observer = ObserverBloc();
  runApp(const App());
}
