import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/detail.dart';

abstract class CafeRepository {
  Future<List<Cafe>> getList();

  Future<Detail> getDetail(String id);

  Future<List<Cafe>> getSearch(String value);

  Future<int> localInsertItem(Cafe cafe);

  Future<List<Cafe>> localGetAllItem();

  Future<Cafe> localGetItemById(String id);

  Future<int> localRemoveItem(String id);

  Future<void> saveDarkTheme(bool isDarkTheme);

  Future<bool> getIsDarkTheme();

  Future<void> saveNotification(bool isNotify);

  Future<bool> getNotification();
}
