import 'package:amary_cafe/data/implementation/remote/response/cafe_detail_response.dart';
import 'package:amary_cafe/data/implementation/remote/response/cafe_list_response.dart';

abstract class CafeApi {
  Future<CafeListResponse> getCafeList();
  Future<CafeDetailResponse> getDetail(String id);
  Future<CafeListResponse> getSearch(String value);
}
