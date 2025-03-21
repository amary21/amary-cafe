import 'package:amary_cafe/data/api/model/detail.dart';
import 'package:amary_cafe/feature/detail/widget/menu_widget.dart';
import 'package:flutter/material.dart';

class BodyDetailWidget extends StatelessWidget {
  final Detail detail;

  const BodyDetailWidget({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(detail.pictureId, fit: BoxFit.cover),
            const SizedBox.square(dimension: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        detail.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        "${detail.address}, ${detail.city}",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox.square(dimension: 4),
                    Text(
                      detail.rating.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox.square(dimension: 16),
            Text(
              detail.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            MenuWidget(
              menus: detail.menu.foods,
              title: "Makanan",
              image: detail.pictureId,
            ),
            MenuWidget(
              menus: detail.menu.drinks,
              title: "Minuman",
              image: detail.pictureId,
            ),
          ],
        ),
      ),
    );
  }
}
