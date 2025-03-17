import 'package:amary_cafe/data/implementation/remote/response/cafe_menu_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_name_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_review_response.dart';

class CafeDetailItemResponse {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final double rating;
  final List<CafeNameResponse> categories;
  final CafeMenuResponse menus;
  final List<CafeReviewResponse> reviews;

  CafeDetailItemResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.reviews,
  });

  factory CafeDetailItemResponse.fromJson(
    Map<String, dynamic> json,
    String imageUrl,
  ) {
    return CafeDetailItemResponse(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      city: json["city"],
      address: json["address"],
      pictureId: "$imageUrl${json["pictureId"]}",
      rating: json["rating"].toDouble(),
      categories:
          json["categories"] != null
              ? List<CafeNameResponse>.from(
                json["categories"]!.map((x) => CafeNameResponse.fromJson(x)),
              )
              : <CafeNameResponse>[],
      menus: CafeMenuResponse.fromJson(json["menus"]),
      reviews:
          json["reviews"] != null
              ? List<CafeReviewResponse>.from(
                json["reviews"]!.map((x) => CafeReviewResponse.fromJson(x)),
              )
              : <CafeReviewResponse>[],
    );
  }
}
