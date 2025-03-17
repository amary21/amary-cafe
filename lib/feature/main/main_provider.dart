import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int _indexBottomNabBar = 0;

  int get indexBottomNabBar => _indexBottomNabBar;

  set setIndexBottomNabBar(int value) {
    _indexBottomNabBar = value;
    notifyListeners();
  }
}
