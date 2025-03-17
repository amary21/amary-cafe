import 'package:amary_cafe/data/api/model/name.dart';
import 'package:amary_cafe/feature/detail/widget/menu_item_widget.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final List<Name> menus;
  final String title;
  final String image;

  const MenuWidget({
    super.key,
    required this.menus,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          height: 180,
          margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: menus.length,
            itemBuilder: (context, index) {
              final menu = menus[index];
              return MenuItemWidget(name: menu.name, image: image);
            },
          ),
        ),
      ],
    );
  }
}
