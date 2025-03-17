import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String name;
  final String image;

  const MenuItemWidget({
    super.key, 
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Image.network(
              image,
              color: Color.fromRGBO(128, 128, 128, 1),
              colorBlendMode: BlendMode.modulate,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(16.0),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme
                  .titleMedium?.apply(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
