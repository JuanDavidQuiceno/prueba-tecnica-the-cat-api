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

  static const textColor = neutral900;
  static const primaryColor = primary300;
  static const secondaryColor = primary300;
  static const transparent = Colors.transparent;
  static const buttonColor = Color(0xFF14081B);
  static const iconUnSelect = neutral900;
  static const inactived = neutral300;

  static const success = Color(0xFF0DA500);
  static const warning = Color(0xFFFFE600);
  static const error = Color(0xFFFF0000);

  static const black = Color(0xFF111111);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFA1A1A1);
  static const lightGrey = Color(0xFFF1F2EB);
  static const errorText = Color(0xFFF4667B);
  static const errorBorder = Color(0xFFE03E3E);

  static const gradientColor = [primary300, secondary300, Color(0xFF8CF78A)];

  // primary
  static const primary20 = Color(0xFFF9FCFF);
  static const primary50 = Color(0xFFF0F9FF);
  static const primary100 = Color(0xFFE0F2FE);
  static const primary200 = Color(0xFFBBE5FC);
  static const primary300 = Color(0xFF7DD1FB);
  static const primary400 = Color(0xFF39BAF7);
  static const primary500 = Color(0xFF10A2E7);
  static const primary600 = Color(0xFF0482C5);
  static const primary700 = Color(0xFF0467A0);
  static const primary800 = Color(0xFF085884);
  static const primary900 = Color(0xFF0D496D);
  static const primary950 = Color(0xFF082E49);

  //Secondary o Complementary-1
  static const secondary50 = Color(0xFFEEFBF2);
  static const secondary100 = Color(0xFFD6F5DE);
  static const secondary200 = Color(0xFFB0EAC2);
  static const secondary300 = Color(0xFF73D698);
  static const secondary400 = Color(0xFF47C078);
  static const secondary500 = Color(0xFF24A55C);
  static const secondary600 = Color(0xFF16854A);
  static const secondary700 = Color(0xFF126A3D);
  static const secondary800 = Color(0xFF115432);
  static const secondary900 = Color(0xFF0E462A);
  static const secondary950 = Color(0xFF072718);

  // neutral
  static const neutral10 = Color(0xFFFCFEFF);
  static const neutral20 = Color(0xFFF6FAFF);
  static const neutral50 = Color(0xFFF9FDFF);
  static const neutral100 = Color(0xFFD5DDE2);
  static const neutral200 = Color(0xFFC1CCD3);
  static const neutral300 = Color(0xFFA5B5BF);
  static const neutral400 = Color(0xFF94A7B3);
  static const neutral500 = Color(0xFF7991A0);
  static const neutral600 = Color(0xFF6E8492);
  static const neutral700 = Color(0xFF566772);
  static const neutral800 = Color(0xFF435058);
  static const neutral900 = Color(0xFF333D43);
  static const neutral950 = Color(0xFF111213);
}
