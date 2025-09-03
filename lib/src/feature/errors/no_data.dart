import 'package:app/src/common/constant/image_app.dart';
import 'package:app/src/shared/utils/utils.dart';
import 'package:app/src/shared/widgets/buttons/custom_elevated_button.dart';
import 'package:app/src/shared/widgets/images/custom_image.dart';

import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({
    super.key,
    this.image,
    this.message,
    this.buttonText,
    this.onPressed,
    this.fit,
    this.heightImage,
    this.widthImage,
  });
  final String? image;
  final BoxFit? fit;
  final double? heightImage;
  final double? widthImage;
  final String? message;
  final String? buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: CustomImage(
              image ?? ImageApp.imageNotFound,
              fit: fit ?? BoxFit.contain,
              height: heightImage ?? 200,
              width: widthImage ?? 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: defaultPadding,
            ),
            child: Text(
              message ?? 'Parece que no hay datos para mostrar.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          if (onPressed != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: CustomElevatedButton(
                text: buttonText ?? 'Intentar de nuevo',
                buttonStyle: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  ),
                ),
                onPressed: onPressed,
              ),
            ),
        ],
      ),
    );
  }
}
