import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/detail.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/data/implementation/mapper/cafe_mapper.dart';
import 'package:amary_cafe/data/implementation/remote/api/cafe_api.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_detail_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_list_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_response.dart';

class CafeRepositoryImpl implements CafeRepository {
  final CafeApi _cafeApi;

  CafeRepositoryImpl(this._cafeApi);

  @override
  Future<List<Cafe>> getList() async {
    try {
      CafeListResponse cafeListResponse = await _cafeApi.getCafeList();
      if (cafeListResponse.error) {
        throw Exception(cafeListResponse.message);
      } else {
        List<CafeResponse> cafeResponse = cafeListResponse.cafes;
        return cafeResponse.map((element) => element.toCafe()).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Detail> getDetail(String id) async {
    try {
      CafeDetailResponse cafeDetailResponse = await _cafeApi.getDetail(id);
      if (cafeDetailResponse.error) {
        return throw Exception(cafeDetailResponse.message);
      } else {
        return cafeDetailResponse.cafe.toDetail();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Cafe>> getSearch(String value) async {
    try {
      CafeListResponse cafeListResponse = await _cafeApi.getSearch(value);
      if (cafeListResponse.error) {
        throw Exception(cafeListResponse.message);
      } else {
        List<CafeResponse> cafeResponse = cafeListResponse.cafes;
        return cafeResponse.map((element) => element.toCafe()).toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
