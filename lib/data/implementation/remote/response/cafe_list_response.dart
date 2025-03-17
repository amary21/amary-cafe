import 'package:amary_cafe/data/implementation/remote/response/cafe_response.dart';

class CafeListResponse {
  final bool error;
  final String? message;
  final int? count;
  final List<CafeResponse> cafes;

  CafeListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.cafes,
  });

  factory CafeListResponse.fromJson(
    Map<String, dynamic> json, 
    String imageUrl
  ) {
    return CafeListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      cafes: json["restaurants"] != null
          ? List<CafeResponse>.from(
            json["restaurants"]!.map((x) => CafeResponse.fromJson(x, imageUrl))
          )
          : <CafeResponse>[]
    );
  }
}
