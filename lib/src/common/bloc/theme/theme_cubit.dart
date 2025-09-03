import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  // El estado inicial por defecto será el modo claro.
  ThemeCubit() : super(ThemeMode.light) {
    // Al crear el Cubit, intentamos cargar el tema guardado.
    _loadTheme();
  }

  void _loadTheme() {
    emit(ThemeMode.light);
  }

  /// Guarda el ThemeMode actual en SharedPreferences.
  Future<void> _saveTheme(ThemeMode themeMode) async {}

  /// Cambia el tema actual al opuesto y lo guarda.
  void toggleTheme() {
    // Determinamos cuál será el nuevo tema.
    final newTheme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

    // Guardamos la nueva preferencia.
    _saveTheme(newTheme);

    // Emitimos el nuevo estado para que la UI se reconstruya.
    emit(newTheme);
  }
}
