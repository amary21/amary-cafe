class CafeReviewResponse {
    final String name;
    final String review;
    final String date;

    CafeReviewResponse({
      required this.name,
      required this.review,
      required this.date,
    });

    factory CafeReviewResponse.fromJson(Map<String, dynamic> json) {
      return CafeReviewResponse(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
    }
}