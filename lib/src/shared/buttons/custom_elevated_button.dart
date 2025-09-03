import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.onLongPress,
    this.child,
    this.text,
    this.expaned = false,
    this.buttonStyle,
    this.textStyle,
    this.elevation = 0,
    // this.type = TypeStyleButton.primary,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.center,
  });
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final String? text;
  final Widget? child;
  final bool? expaned;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double? elevation;
  // final TypeStyleButton? type;
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
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 0),
        onPressed: onPressed,
        onLongPress: onLongPress,
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
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox(),
      label: child ?? Text(text ?? 'Press me!'),
    );
  }
}
