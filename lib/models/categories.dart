import 'package:constrack/presentation/widgets/theme.dart';
import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final String subTitle;
  final String categoryImage;
  final Color color;
  final Color textColor;

  Category(
      {required this.id,
      required this.color,
      required this.title,
      required this.subTitle,
      required this.categoryImage,
      required this.textColor});
}

final List<Category> category = [
  Category(
    id: 1,
    color: ConstrackColors.veryLightOriginal,
    title: 'Track NASS Products',
    subTitle:
        'Know what projects have been awarded \nnand are ongoing or completed',
    categoryImage: 'assets/images/image1.png',
    textColor: ConstrackColors.original,
  ),
  Category(
    id: 2,
    color: ConstrackColors.gold,
    title: 'Search Projects by MDAs',
    subTitle: 'View the existing MDAs and browse \nprojects they are handling',
    categoryImage: 'assets/images/image3.png',
    textColor: ConstrackColors.veryLightOriginal,
  ),
  Category(
      id: 3,
      color: ConstrackColors.veryLightOriginal,
      title: 'Look up Lawmakers',
      subTitle:
          'Look up Lawmakers and know what \nprojects they are currently handling.',
      categoryImage: 'assets/images/image2.png',
      textColor: ConstrackColors.original),
];
