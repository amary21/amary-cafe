class CafeNameResponse {
  final String name;

  CafeNameResponse({required this.name});

  factory CafeNameResponse.fromJson(Map<String, dynamic> json) {
    return CafeNameResponse(name: json["name"]);
  }
}
