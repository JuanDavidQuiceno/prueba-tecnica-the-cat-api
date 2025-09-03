import 'package:app/src/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

enum TypeStyleButton { primary, secondary }

class CustomStyleButton {
  static ButtonStyle textButtonTheme({
    EdgeInsets? padding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 2,
    ),
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    RoundedRectangleBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? textColor,
    double? elevation,
    // shape
  }) {
    return TextButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.transparent,
      foregroundColor: foregroundColor ?? AppColors.buttonColor,
      splashFactory: InkRipple.splashFactory,
      // color de splash cuando se presiona
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
      ),
      shadowColor: backgroundColor ?? AppColors.primaryColor,
      surfaceTintColor: backgroundColor ?? AppColors.primaryColor,
      elevation: elevation ?? 0,
      // Body 2
      // context.body2
      textStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: textColor ?? AppColors.black,
        // height: 30.7,
      ),
    );
  }

  static ButtonStyle outlinedButtonTheme({
    EdgeInsets? padding,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    RoundedRectangleBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? textColor,
    double? elevation,
  }) {
    return OutlinedButton.styleFrom(
      // surfaceTintColor: AppColors.primaryColor,
      backgroundColor: backgroundColor ?? AppColors.transparent,
      foregroundColor: foregroundColor ?? AppColors.buttonColor,
      splashFactory: InkRipple.splashFactory,
      // color de splash cuando se presiona
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
        side: BorderSide(color: backgroundColor ?? AppColors.primaryColor),
      ),
      shadowColor: backgroundColor ?? AppColors.primaryColor,
      elevation: elevation ?? 0,
      side: BorderSide(color: backgroundColor ?? AppColors.primaryColor),
      textStyle: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: textColor ?? AppColors.black,
        // height: 30.7,
      ),
    );
  }

  static ButtonStyle elevatedButtonTheme({
    EdgeInsets? padding,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    RoundedRectangleBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? textColor,
    double? elevation,
  }) {
    return ElevatedButton.styleFrom(
      // surfaceTintColor: AppColors.primaryColor,
      backgroundColor: backgroundColor ?? AppColors.buttonColor,
      foregroundColor: foregroundColor ?? AppColors.white,
      splashFactory: InkRipple.splashFactory,
      // color de splash cuando se presiona
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
      ),
      shadowColor: backgroundColor ?? AppColors.primaryColor,
      elevation: elevation ?? 5,
      textStyle: TextStyle(
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: textColor ?? AppColors.white,
        // height: 30.7,
      ),
    );
  }

  static ButtonStyle iconButtonTheme({
    EdgeInsets? padding,
    TextStyle? textStyle,
    BorderRadius? borderRadius,
    RoundedRectangleBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? splashColor,
    Color? textColor,
    double? elevation,
  }) {
    return IconButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.transparent,
      foregroundColor: foregroundColor ?? AppColors.buttonColor,
      splashFactory: InkRipple.splashFactory,
      // color de splash cuando se presiona
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(100),
      ),
      shadowColor: backgroundColor ?? AppColors.primaryColor,
      elevation: elevation ?? 0,
      iconSize: 24,
      // height: 30.7,
    );
  }
}
