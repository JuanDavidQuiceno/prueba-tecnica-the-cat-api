import 'package:flutter/material.dart';

class CustomOutLinedButton extends StatelessWidget {
  const CustomOutLinedButton({
    super.key,
    this.onPressed,
    this.child,
    this.text,
    this.expaned = false,
    this.buttonStyle,
    this.textStyle,
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
  final int maxLines;
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
      child: OutlinedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child:
            child ??
            Text(
              text ?? 'Press me!',
              style: textStyle,
              maxLines: maxLines,
              overflow: overflow,
              textAlign: textAlign,
            ),
      ),
    );
  }
}

class CustomOutLinedButtonIcon extends StatelessWidget {
  const CustomOutLinedButtonIcon({
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
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox(),
      label: child ?? Text(text ?? 'Press me!'),
    );
  }
}
