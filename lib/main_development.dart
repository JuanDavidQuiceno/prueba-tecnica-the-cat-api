import 'package:app/src/app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// inicializar inyección de dependencias
  // setUpGlobalLocator();
  // Bloc.observer = ObserverBloc();
  runApp(const App());
}
