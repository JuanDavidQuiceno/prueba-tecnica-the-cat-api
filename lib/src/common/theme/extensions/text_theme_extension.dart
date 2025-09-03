import 'package:app/src/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

const _baseFont = TextStyle(
  // fontFamily: 'Nunito',
  fontSize: 14,
  color: AppColors.textColor,
  fontWeight: FontWeight.w400,
);

/// Helper function to get the current text theme from the context.
/// This is used to avoid repetitive calls to Theme.of(context).textTheme.
/// It provides a single point of access to the text theme,
/// ensuring consistency and reducing boilerplate code.
/// @param context The BuildContext from which to retrieve the text theme.
/// @return The current TextTheme from the context.
/// This function is used throughout the app to access text styles
/// defined in the theme, allowing for easy customization and theming.
/// It ensures that all text styles are derived from the same base font,
/// maintaining a consistent look and feel across the application.
/// @example
/// ```dart
/// Text('Hello World', style: context.headlineLarge);
/// ```
/// This example shows how to use the `headlineLarge` style
/// from the text theme extension in a widget.
/// @see [ThemeExtension]
/// @see [TextTheme]
/// @see [AppColors]
///
TextTheme _getTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

extension ThemeExtension on BuildContext {
  /// Heading H1
  TextStyle get headingH1 {
    return _getTextTheme(this).headlineLarge ?? _baseFont;
  }

  /// Heading H2
  TextStyle get headingH2 {
    return _getTextTheme(this).headlineMedium ?? _baseFont;
  }

  /// Heading H3
  TextStyle get headingH3 {
    return _getTextTheme(this).headlineSmall ?? _baseFont;
  }

  /// Heading H3
  TextStyle get headingH4 {
    return _getTextTheme(this).labelLarge ?? _baseFont;
  }

  /// Body 1
  TextStyle get body1 {
    return _getTextTheme(this).bodyLarge ?? _baseFont;
  }

  /// Body 2
  TextStyle get body2 {
    return _getTextTheme(this).bodyMedium ?? _baseFont;
  }

  /// Body 3
  TextStyle get body3 {
    return _getTextTheme(this).bodySmall ?? _baseFont;
  }

  /// Body 4
  TextStyle get body4 {
    return _getTextTheme(this).labelSmall ?? _baseFont;
  }

  /// CTA
  TextStyle get cta {
    return _getTextTheme(this).labelMedium ?? _baseFont;
  }

  /// Link
  TextStyle get link {
    return _getTextTheme(this).displayLarge ?? _baseFont;
  }
}
