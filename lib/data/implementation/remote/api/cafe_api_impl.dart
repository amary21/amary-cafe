import 'dart:convert';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_detail_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_list_response.dart';
import 'package:http/http.dart' as http;

class CafeApiImpl implements CafeApi {
  final String _baseUrl;
  final String _baseImageUrl;

  CafeApiImpl({
    required String baseUrl,
    required String baseImageUrl,
  }) : _baseUrl = baseUrl,
       _baseImageUrl = baseImageUrl;

  @override
  Future<CafeListResponse> getCafeList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return CafeListResponse.fromJson(
        jsonDecode(response.body),
        _baseImageUrl,
      );
    } else {
      throw Exception("Failed to load cafe list");
    }
  }

  @override
  Future<CafeDetailResponse> getDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));
    if (response.statusCode == 200) {
      return CafeDetailResponse.fromJson(
        jsonDecode(response.body),
        _baseImageUrl,
      );
    } else {
      throw Exception("Failed to load data detail");
    }
  }

  @override
  Future<CafeListResponse> getSearch(String value) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$value"));
    if (response.statusCode == 200) {
      return CafeListResponse.fromJson(
        jsonDecode(response.body),
        _baseImageUrl,
      );
    } else {
      throw Exception("Failed to search cafe list");
    }
  }
}
