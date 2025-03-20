import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/detail.dart';
import 'package:amary_cafe/data/api/model/notify.dart';

abstract class CafeRepository {
  Future<List<Cafe>> getList();

  Future<Detail> getDetail(String id);

  Future<List<Cafe>> getSearch(String value);

  Future<int> localInsertItem(Cafe cafe);

  Future<List<Cafe>> localGetAllItem();

  Future<Cafe> localGetItemById(String id);

  Future<int> localRemoveItem(String id);

  Future<void> saveDarkTheme(DarkTheme value);

  Future<DarkTheme> getIsDarkTheme();

  Future<void> saveNotification(Notify value);

  Future<Notify> getNotification();
}
