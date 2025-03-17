import 'package:amary_cafe/data/api/model/menu.dart';
import 'package:amary_cafe/data/api/model/name.dart';
import 'package:amary_cafe/data/api/model/review.dart';

class Detail {
    final String id;
    final String name;
    final String description;
    final String city;
    final String address;
    final String pictureId;
    final double rating;
    final List<Name> categories;
    final Menu menu;
    final List<Review> reviews;

    Detail({
      required this.id,
      required this.name,
      required this.description,
      required this.city,
      required this.address,
      required this.pictureId,
      required this.rating,
      required this.categories,
      required this.menu,
      required this.reviews,
    });
}