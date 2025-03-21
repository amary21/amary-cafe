import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/detail.dart';
import 'package:amary_cafe/data/api/model/notify.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';

class FakeCafeRepository implements CafeRepository {
  Detail detail = Detail.empty();
  Cafe cafe = Cafe.empty();
  Future<List<Cafe>> cafes = Future.value([]);
  DarkTheme darkTheme = DarkTheme.disable;
  Notify notify = Notify.disable;
  bool isLocalInsertItem = false;
  bool isLocalRemoveItem = false;
  bool isSaveDarkTheme = false;
  bool isSaveNotify = false;

  @override
  Future<Detail> getDetail(String id) async {
    return Future.value(detail);
  }

  @override
  Future<DarkTheme> getIsDarkTheme() async {
    return Future.value(darkTheme);
  }

  @override
  Future<List<Cafe>> getList() async {
    return cafes;
  }

  @override
  Future<Notify> getNotification() async {
    return Future.value(notify);
  }

  @override
  Future<List<Cafe>> getSearch(String value) => cafes;

  @override
  Future<List<Cafe>> localGetAllItem() async {
    return cafes;
  }

  @override
  Future<Cafe> localGetItemById(String id) async {
    return Future.value(cafe);
  }

  @override
  Future<int> localInsertItem(Cafe cafe) async {
    isLocalInsertItem = true;
    return Future.value(1);
  }

  @override
  Future<int> localRemoveItem(String id) async {
    isLocalRemoveItem = true;
    return Future.value(1);
  }

  @override
  Future<void> saveDarkTheme(DarkTheme value) async {
    isSaveDarkTheme = value.isEnable;
  }

  @override
  Future<void> saveNotification(Notify value) async {
    isSaveNotify = value.isEnable;
  }
}
