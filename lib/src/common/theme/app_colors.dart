import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.background,
    // required this.hintColor,
    required this.backgroundIconColor,
    // required this.alertColor,
    required this.transparent,
    required this.onSurface,
    // required this.card,
  });

  final Color background;
  // final Color hintColor;
  final Color backgroundIconColor;
  // final Color alertColor;
  final Color transparent;
  final Color onSurface;
  // final Color card;

  static const AppColorsExtension light = AppColorsExtension(
    background: Color(0xFFFFFFFF),
    // hintColor: Color(0xFF9E9E9E), // Más claro, mejor contraste
    backgroundIconColor: Color(0xFFFFFFFF), // Lila suave y visible
    // alertColor: Color(0xFFFFF9C4), // Amarillo claro para alertas
    transparent: Colors.transparent,
    onSurface: Color(0xFF000000),
    // card: Color(0xFFF5F5F5), // Gris claro, más neutro
  );

  // falta agregar los colores que se usan para dark mode en caso que aplique
  static const AppColorsExtension dark = AppColorsExtension(
    background: Color(0xFF111111),
    // hintColor: Color(0xFFB0BEC5), // Azul-gris claro, bien legible
    backgroundIconColor: Color(0xFF1E1E1E),
    // alertColor: Color(0xFF424242), // Gris oscuro visible, no negro absoluto
    transparent: Colors.transparent,
    onSurface: Color(0xFFFFFFFF),
    // card: Color(0xFF2A2D3E),
  );

  @override
  ThemeExtension<AppColorsExtension> copyWith() => this;

  @override
  ThemeExtension<AppColorsExtension> lerp(
    ThemeExtension<AppColorsExtension>? other,
    double t,
  ) => this;
}

/// A class that holds the color constants used in the application.
/// These colors are used throughout the app for theming and styling.
/// The colors are categorized into primary, secondary, and neutral shades,
/// with specific shades defined for each category.
/// Usage:
/// - Use `AppColors.primaryColor` for primary actions.
/// - Use `AppColors.secondaryColor` for secondary actions.
/// - Use `AppColors.textColor` for general text.
/// - Use `AppColors.gradientColor` for gradient backgrounds.
/// - Use specific color constants for various UI elements as needed.
/// Example:
/// ```dart
/// Container(
///   color: AppColors.primary300,
///   child: Text(
///     'Hello World',
///     style: TextStyle(color: AppColors.textColor),
///   ),
/// );
/// ```
/// This class is designed to be used with Flutter's Material Design system,
/// providing a consistent color scheme across the application.
class AppColors {
  /// Private constructor to prevent instantiation.
  /// This class is intended to be used as a static utility class.
  AppColors._();

  static const Color textColor = Color(0xFF333D43);
  static const Color primaryColor = Color(0xFF7DD1FB);
  static const Color secondaryColor = Color(0xFF7DD1FB);
  static const Color transparent = Colors.transparent;
  static const buttonColor = Color(0xFF14081B);
  static const Color iconUnSelect = Color(0xFF333D43);
  static const Color inactived = Color(0xFFA5B5BF);

  static const success = Color(0xFF0DA500);
  static const warning = Color(0xFFFFE600);
  static const error = Color(0xFFFF0000);

  static const black = Color(0xFF111111);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFA1A1A1);
  static const lightGrey = Color(0xFFF1F2EB);
  static const errorText = Color(0xFFF4667B);
  static const errorBorder = Color(0xFFE03E3E);
}
