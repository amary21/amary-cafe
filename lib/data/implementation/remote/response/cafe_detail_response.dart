import 'package:amary_cafe/data/implementation/remote/response/cafe_detail_item_response.dart';

class CafeDetailResponse {
  final bool error;
  final String message;
  final CafeDetailItemResponse cafe;

  CafeDetailResponse({
    required this.error,
    required this.message,
    required this.cafe,
  });

  factory CafeDetailResponse.fromJson(
    Map<String, dynamic> json,
    String imageUrl,
  ) {
    return CafeDetailResponse(
      error: json["error"],
      message: json["message"],
      cafe: CafeDetailItemResponse.fromJson(json["restaurant"], imageUrl),
    );
  }
}
