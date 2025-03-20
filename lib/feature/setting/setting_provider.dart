import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/notify.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  SettingProvider(this._cafeRepository);

  Notify _notify = Notify.disable;
  Notify get notify => _notify;

  DarkTheme _darkTheme = DarkTheme.disable;
  DarkTheme get darkTheme => _darkTheme;

  Future<void> checkDarkTheme(bool isDarkTheme) async {
    _cafeRepository.saveDarkTheme(isDarkTheme.isEnableDarkTheme);
    _darkTheme = isDarkTheme.isEnableDarkTheme;
    notifyListeners();
  }

  Future<void> changeNotify(Notify value) async {
    _cafeRepository.saveNotification(value);
    _notify = value;
    notifyListeners();
  }

  Future<void> changeTheme(DarkTheme value) async {
    _cafeRepository.saveDarkTheme(value);
    _darkTheme = value;
    notifyListeners();
  }
}
