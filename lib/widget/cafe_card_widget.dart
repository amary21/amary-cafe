import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:flutter/material.dart';

class CafeCardWidget extends StatelessWidget {
  final Cafe cafe;
  final Function() onTap;

  const CafeCardWidget({
    super.key, 
    required this.cafe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 80,
                minHeight: 80,
                maxWidth: 120,
                minWidth: 120,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  cafe.pictureId,
                  fit: BoxFit.cover,
                )
              )
            ),
            const SizedBox.square(dimension: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    cafe.name, 
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox.square(dimension: 6),
                  Row(
                   children: [
                     const Icon(Icons.pin_drop),
                     const SizedBox.square(dimension: 4),
                     Expanded(
                       child: Text(
                         cafe.city,
                         overflow: TextOverflow.ellipsis,
                         maxLines: 1,
                         style: Theme.of(context).textTheme.bodyMedium,
                       ),
                     ),
                   ],
                  ),
                  const SizedBox.square(dimension: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      
                      ),
                      const SizedBox.square(dimension: 4),
                      Expanded(
                        child: Text(
                          cafe.rating.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
