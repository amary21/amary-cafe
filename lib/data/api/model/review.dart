class Review {
  final String name;
  final String review;
  final String date;

  Review({required this.name, required this.review, required this.date});

  factory Review.empty() {
    return Review(name: "", review: "", date: "");
  }
}
