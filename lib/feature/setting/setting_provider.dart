import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/notify.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/service/notification_service.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;
  final NotificationService _notificationService;

  SettingProvider(
    this._cafeRepository,
    this._notificationService,
  );

  Notify _notify = Notify.disable;
  Notify get notify => _notify;

  DarkTheme _darkTheme = DarkTheme.disable;
  DarkTheme get darkTheme => _darkTheme;

  int _notificationId = 0;
  bool? _permission = false;
  bool? get permission => _permission;

  Future<void> requestPermissions() async {
   _permission = await _notificationService.requestPermissions();
   notifyListeners();
  }

  void showNotification() {
   _notificationId += 1;
   _notificationService.showNotification(
     id: _notificationId,
     title: "New Notification",
     body: "This is a new notification with id $_notificationId",
     payload: "This is a payload from notification with id $_notificationId",
   );
  }

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
