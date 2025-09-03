import 'package:app/src/common/environments.dart';
import 'package:app/src/common/theme/extensions/text_theme_extension.dart';
import 'package:app/src/feature/home/domain/cat_model.dart';
import 'package:app/src/shared/widgets/images/custom_image.dart';
import 'package:flutter/material.dart';

class CatDetailtScreen extends StatelessWidget {
  const CatDetailtScreen({required this.catModel, super.key});
  static const String routeName = 'catDetailt';
  final CatModel catModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          catModel.name ?? '',
          style: context.headingH2,
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: '${catModel.id}${catModel.referenceImageId!}',
            child: CustomImage(
              '${Environment.urlCatImage}/${catModel.referenceImageId}.jpg',
              type: ImageType.network,
              height: size.height * 0.5,
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: [
                  if (catModel.name != null)
                    ListTile(
                      leading: const Icon(Icons.pets),
                      title: Text(
                        catModel.name!,
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.origin != null)
                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(
                        catModel.origin!,
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.temperament != null)
                    ListTile(
                      leading: const Icon(Icons.emoji_nature),
                      title: Text(
                        catModel.temperament!,
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.lifeSpan != null)
                    ListTile(
                      leading: const Icon(Icons.date_range),
                      title: Text(
                        catModel.lifeSpan!,
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.wikipediaUrl != null)
                    ListTile(
                      leading: const Icon(Icons.link),
                      title: Text(
                        catModel.wikipediaUrl!,
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.description != null)
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: Text(
                        catModel.description!,
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.adaptability != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.adaptability!.toString(),
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.affectionLevel != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.affectionLevel!.toString(),
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.childFriendly != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.childFriendly!.toString(),
                        style: context.headingH4,
                      ),
                    ),
                  if (catModel.dogFriendly != null)
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(
                        catModel.dogFriendly!.toString(),
                        style: context.headingH4,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
