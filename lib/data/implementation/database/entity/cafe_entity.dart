class CafeEntity {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  CafeEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
   return <String, dynamic>{
     "id": id,
     "name": name,
     "description": description,
     "pictureId": pictureId,
     "city": city,
     "rating": rating,
   };
 }

  factory CafeEntity.fromJson(Map<String, dynamic> json) {
    return CafeEntity(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      pictureId: json["pictureId"],
      city: json["city"],
      rating: json["rating"].toDouble(),
    );
  }
}