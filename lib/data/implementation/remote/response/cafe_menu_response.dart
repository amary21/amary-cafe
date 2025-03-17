import 'package:amary_cafe/data/implementation/remote/response/cafe_name_response.dart';

class CafeMenuResponse {
    final List<CafeNameResponse> foods;
    final List<CafeNameResponse> drinks;

    CafeMenuResponse({
      required this.foods,
      required this.drinks,
    });

    factory CafeMenuResponse.fromJson(Map<String, dynamic> json) {
      return CafeMenuResponse(
        foods: json["foods"] != null
          ? List<CafeNameResponse>.from(
            json["foods"]!.map((x) => CafeNameResponse.fromJson(x))
          )
          : <CafeNameResponse>[],
        drinks: json["drinks"] != null
          ? List<CafeNameResponse>.from(
            json["drinks"]!.map((x) => CafeNameResponse.fromJson(x))
          )
          : <CafeNameResponse>[]
      );
  }
}