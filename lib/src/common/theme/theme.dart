// lib/config/theme/app_theme.dart
import 'package:app/src/common/theme/app_colors.dart';
import 'package:app/src/shared/buttons/theme/custom_style_buttons.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData light = _buildLightTheme();
  static final ThemeData dark = _buildDarkTheme();

  /// Construye el TEMA CLARO de la aplicación
  static ThemeData _buildLightTheme() {
    const colors = AppColorsExtension.light;
    return ThemeData(
      brightness: Brightness.light,
      extensions: const <ThemeExtension<dynamic>>[AppColorsExtension.light],
      colorScheme: _colorScheme(Brightness.light),
      scaffoldBackgroundColor: colors.background,
      textTheme: _buildTextTheme(AppColors.textColor),
      appBarTheme: _appBarTheme(colors),
      buttonTheme: _buttonTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: CustomStyleButton.elevatedButtonTheme(),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: CustomStyleButton.outlinedButtonTheme(),
      ),
      textButtonTheme: TextButtonThemeData(
        style: CustomStyleButton.textButtonTheme(),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: CustomStyleButton.iconButtonTheme(),
      ),
      inputDecorationTheme: _inputDecorationTheme(Brightness.light),
      dividerTheme: _dividerTheme(),
      tooltipTheme: _tooltipTheme(Brightness.light),
    );
  }

  /// Construye el TEMA OSCURO de la aplicación (migrado desde tu archivo
  /// original)
  static ThemeData _buildDarkTheme() {
    const colors = AppColorsExtension.dark;
    return ThemeData(
      brightness: Brightness.dark,
      extensions: const <ThemeExtension<dynamic>>[AppColorsExtension.dark],
      colorScheme: _colorScheme(Brightness.dark),
      scaffoldBackgroundColor: colors.background,
      textTheme: _buildTextTheme(AppColors.textColor),
      appBarTheme: _appBarTheme(colors),
      buttonTheme: _buttonTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            CustomStyleButton.elevatedButtonTheme(), // Asumiendo que se adapta
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style:
            CustomStyleButton.outlinedButtonTheme(), // Asumiendo que se adapta
      ),
      textButtonTheme: TextButtonThemeData(
        style: CustomStyleButton.textButtonTheme(), // Asumiendo que se adapta
      ),
      inputDecorationTheme: _inputDecorationTheme(Brightness.dark),
      dividerTheme: _dividerTheme(),
      tooltipTheme: _tooltipTheme(Brightness.dark),
    );
  }

  // --- MÉTODOS AUXILIARES ---
  static ColorScheme _colorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.black,
      error: AppColors.error,
      onError: AppColors.white,
      surface: (brightness == Brightness.dark)
          ? AppColorsExtension.dark.background
          : AppColorsExtension.light.background,
      onSurface: (brightness == Brightness.dark)
          ? AppColorsExtension.dark.onSurface
          : AppColorsExtension.light.onSurface,
      // Colores adicionales de tu tema
      tertiary: AppColors.success,
      outline: AppColors.warning,
    );
  }

  static TextTheme _buildTextTheme(Color color) {
    const font = 'Nunito';
    return TextTheme(
      // Heading H1
      headlineLarge: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w600,
        fontSize: 28,
        color: color,
      ),
      // Heading H2
      headlineMedium: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: color,
      ),
      // Heading H3
      headlineSmall: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: color,
      ),
      // Heading H4
      labelLarge: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: color,
      ),
      // Body 1
      bodyLarge: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: color,
      ),
      // Body 2
      bodyMedium: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: color,
      ),
      // Body 3
      bodySmall: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: color,
      ),
      // body 4
      labelSmall: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: color,
      ),
      // CTA
      labelMedium: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color,
      ),
      // Link
      displayLarge: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: color,
      ),
    );
  }

  static AppBarTheme _appBarTheme(AppColorsExtension colors) {
    return AppBarTheme(
      backgroundColor: const Color.fromRGBO(17, 18, 21, 0.2),
      iconTheme: IconThemeData(color: colors.backgroundIconColor, size: 24),
      elevation: 1,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
    );
  }

  static ButtonThemeData _buttonTheme() {
    return ButtonThemeData(
      buttonColor: AppColors.black,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(Brightness brightness) {
    const font = 'Nunito';
    return InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.errorBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.errorBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.textColor),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.textColor),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.textColor),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: (brightness == Brightness.dark)
          ? AppColors.transparent
          : AppColors.transparent,
      // contentPadding: const EdgeInsets.symmetric(
      //vertical: 10,
      //horizontal: 16),
      errorStyle: const TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: AppColors.errorText,
      ),
      labelStyle: const TextStyle(
        fontFamily: font,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      prefixStyle: const TextStyle(
        fontFamily: font,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: const TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.grey,
        // height: 1.42,
      ),
      helperStyle: const TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.grey,
      ),
    );
  }

  static DividerThemeData _dividerTheme() {
    return const DividerThemeData(color: AppColors.lightGrey, thickness: 1);
  }

  static TooltipThemeData _tooltipTheme(Brightness brightness) {
    const font = 'Nunito';
    final isDark = brightness == Brightness.dark;

    return TooltipThemeData(
      preferBelow: false,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: TextStyle(
        fontFamily: font,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: isDark ? AppColors.white : const Color(0XFF1B1B1A),
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2E2E2E) : const Color(0xFFFBFBFB),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(10, 13, 18, 0.08),
            offset: Offset(0, 12),
            blurRadius: 16,
            spreadRadius: -4,
          ),
          BoxShadow(
            color: Color.fromRGBO(10, 13, 18, 0.03),
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -2,
          ),
        ],
      ),
    );
  }
}
