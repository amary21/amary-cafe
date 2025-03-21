import 'package:amary_cafe/data/api/model/dark_theme.dart';
import 'package:amary_cafe/data/api/model/notify.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SettingProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;
  final NotificationService _notificationService;

  SettingProvider(this._cafeRepository, this._notificationService);

  Notify _notify = Notify.disable;
  Notify get notify => _notify;

  DarkTheme _darkTheme = DarkTheme.disable;
  DarkTheme get darkTheme => _darkTheme;

  int _notificationId = 0;
  bool? _permission = false;
  bool? get permission => _permission;

  List<PendingNotificationRequest> pendingNotificationRequests = [];

  void scheduleDailyTenAMNotification() {
    _notificationId += 1;
    _notificationService.scheduleDailyTenAMNotification(id: _notificationId);
  }

  Future<void> checkPendingNotificationRequests(BuildContext context) async {
    pendingNotificationRequests =
        await _notificationService.pendingNotificationRequests();
    notifyListeners();
  }

  Future<void> cancelNotification() async {
    for (var item in pendingNotificationRequests) {
      await _notificationService.cancelNotification(item.id);
    }
  }

  Future<void> requestPermissions() async {
    _permission = await _notificationService.requestPermissions();
    notifyListeners();
  }

  Future<void> checkDarkTheme(bool isDarkTheme) async {
    _cafeRepository.saveDarkTheme(isDarkTheme.isEnableDarkTheme);
    _darkTheme = isDarkTheme.isEnableDarkTheme;
    notifyListeners();
  }

  Future<void> changeNotify(Notify value) async {
    _cafeRepository.saveNotification(value);
    _notify = value;
    if (value.isEnable) {
      scheduleDailyTenAMNotification();
    } else {
      cancelNotification();
    }
    notifyListeners();
  }

  Future<void> changeTheme(DarkTheme value) async {
    _cafeRepository.saveDarkTheme(value);
    _darkTheme = value;
    notifyListeners();
  }
}
