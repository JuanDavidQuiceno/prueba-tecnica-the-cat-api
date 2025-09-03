import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A highly customizable text field widget with built-in validation,
/// internationalization support, and theme integration.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    // Control properties
    this.focusNode,
    this.controller,
    this.initialValue,
    this.readOnly = false,
    this.enabled = true,
    this.obscureText = false,

    // Behavior properties
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,

    // Appearance properties
    this.hintText,
    this.labelText,
    this.helperText,
    this.errorText,
    this.filled = false,
    this.fillColor,
    this.style,
    this.decoration,
    this.suffix,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.prefix,
    this.prefixIcon,
    this.prefixIconConstraints,

    this.padding,
    this.isDense = true,

    // Content properties
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.errorMaxLines,

    // Callbacks
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.onTapOutSide,
    this.onFieldSubmitted,

    // Validation
    this.validator,
  });

  // Control properties
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? initialValue;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;

  // Behavior properties
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final bool enableSuggestions;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;

  // Appearance properties
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? errorText;
  final bool filled;
  final Color? fillColor;
  final TextStyle? style;
  final InputDecoration? decoration;
  final Widget? suffix;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Widget? prefix;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final EdgeInsetsGeometry? padding;
  final bool? isDense;

  // Content properties
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;

  // Callbacks
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutSide;
  final void Function(String)? onFieldSubmitted;

  // Validation
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      style: style ?? theme.textTheme.bodyMedium,
      decoration:
          decoration ??
          InputDecoration(
            hintText: hintText,
            labelText: labelText,
            helperText: helperText,
            errorText: errorText,
            filled: filled,
            fillColor: fillColor,
            contentPadding: padding,
            suffix: suffix,
            isDense: isDense,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
      autovalidateMode: autovalidateMode,
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      onTapOutside: onTapOutSide,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      enabled: enabled,
    );
  }
}
