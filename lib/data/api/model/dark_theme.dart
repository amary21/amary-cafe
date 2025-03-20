enum DarkTheme {
  enable,
  disable;

  bool get isEnable => this == DarkTheme.enable;
}

extension DarkThemeExt on bool {
  DarkTheme get isEnableDarkTheme => 
    this == true ? DarkTheme.enable : DarkTheme.disable;
}
