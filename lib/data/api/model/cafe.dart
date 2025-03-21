class Cafe {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;

  Cafe({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Cafe.empty() {
    return Cafe(
      id: "",
      name: "",
      description: "",
      pictureId: "",
      city: "",
      rating: 0,
    );
  }
}
