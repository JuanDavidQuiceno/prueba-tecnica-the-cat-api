import 'package:app/src/common/config/environments.dart';
import 'package:app/src/common/theme/extensions/text_theme_extension.dart';
import 'package:app/src/feature/home/domain/cat_model.dart';
import 'package:app/src/feature/home/presentation/cat_detail/cat_detail_screen.dart';
import 'package:app/src/shared/widgets/images/custom_image.dart';

import 'package:flutter/material.dart';

class HomeCatCard extends StatelessWidget {
  const HomeCatCard({required this.catModel, super.key});
  final CatModel catModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              settings: const RouteSettings(name: CatDetailtScreen.routeName),
              builder: (context) => CatDetailtScreen(catModel: catModel),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (catModel.name != null)
                    Expanded(
                      child: Text(catModel.name!, style: context.headingH3),
                    ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Más...',
                      style: context.body1.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Hero(
                  tag: '${catModel.id}${catModel.referenceImageId!}',
                  child: CustomImage(
                    '${Environment.urlCatImage}/${catModel.referenceImageId}.jpg',
                    type: ImageType.network,
                    height: size.height * 0.4,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  if (catModel.origin != null)
                    Expanded(
                      child: Text(
                        catModel.origin!,
                        style: context.headingH3,
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (catModel.intelligence != null)
                    Expanded(
                      child: Text(
                        catModel.intelligence!.toString(),
                        style: context.headingH3,
                        textAlign: TextAlign.end,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
