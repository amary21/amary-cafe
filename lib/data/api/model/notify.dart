enum Notify {
  enable,
  disable;

  bool get isEnable => this == Notify.enable;
}

extension NotificationExt on bool {
  Notify get isEnableNotify => 
    this == true ? Notify.enable : Notify.disable;
}

