abstract class CafePreference {
  Future<void> saveDarkTheme(bool isDarkTheme);

  Future<bool> getIsDarkTheme();

  Future<void> saveNotification(bool isNotify);

  Future<bool> getNotification();
}
