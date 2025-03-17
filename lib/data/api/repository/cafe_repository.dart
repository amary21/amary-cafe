import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/detail.dart';

abstract class CafeRepository {
  Future<List<Cafe>> getList();

  Future<Detail> getDetail(String id);

  Future<List<Cafe>> getSearch(String value);
}
