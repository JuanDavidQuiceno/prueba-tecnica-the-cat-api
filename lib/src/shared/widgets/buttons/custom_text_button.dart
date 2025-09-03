import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    this.child,
    this.text,
    this.expaned = false,
    this.buttonStyle,
    this.textStyle,
    // this.type = TypeStyleButton.primary,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.center,
  });
  final void Function()? onPressed;
  final String? text;
  final Widget? child;
  final bool? expaned;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  // final TypeStyleButton type;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    if (expaned ?? false) {
      return Row(children: [Expanded(child: button(context))]);
    }
    return button(context);
  }

  Widget button(BuildContext context) {
    return Tooltip(
      message: text ?? '',
      child: TextButton(
        style: buttonStyle,
        onPressed: onPressed,
        child:
            child ??
            Text(
              text != null ? text! : 'Press me!',
              style: textStyle,
              maxLines: maxLines,
              overflow: overflow,
              textAlign: textAlign,
            ),
      ),
    );
  }

  Widget iconButton(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: child ?? Text(text ?? 'Press me!'),
      icon: child ?? const Icon(Icons.add),
    );
  }
}

class CustomElevatedButtonIcon extends StatelessWidget {
  const CustomElevatedButtonIcon({
    super.key,
    this.onPressed,
    this.child,
    this.text,
    this.icon,
  });
  final void Function()? onPressed;
  final Widget? child;
  final Widget? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox(),
      label: child ?? Text(text ?? 'Press me!'),
    );
  }
}
