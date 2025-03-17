class CafeResponse {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  CafeResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory CafeResponse.fromJson(Map<String, dynamic> json, String imageUrl) {
    return CafeResponse(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: "$imageUrl${json["pictureId"]}",
      city: json["city"],
      rating: json["rating"].toDouble(),
    );
  }
}
