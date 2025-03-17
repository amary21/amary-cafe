import 'package:amary_cafe/data/api/model/cafe.dart';
import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:flutter/material.dart';

class FavIconProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  FavIconProvider(this._cafeRepository);

  bool _isFavorited = false;
  bool get isFavorited => _isFavorited;

  String _message = "";
  String get message => _message;

  Cafe? _cafe;

  set isFavorited(bool value) {
    _isFavorited = value;
    notifyListeners();
  }

  Future<void> saveCafe(Cafe value) async {
    try {
      final result = await _cafeRepository.localInsertItem(value);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
      } else {
        _message = "Your data is saved";
      }
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
  }

  Future<void> removeCafe(String id) async {
    try {
      final result = await _cafeRepository.localRemoveItem(id);

      final isError = result == 0;
      if (isError) {
        _message = "Failed to save your data";
      } else {
        _message = "Your data is saved";
      }
    } catch (e) {
      _message = "Failed to save your data";
    }
    notifyListeners();
  }

  Future<void> getFavCafe(String id) async {
    try {
      _cafe = await _cafeRepository.localGetItemById(id);
      _message = "Your data is loaded";
      _isFavorited = _cafe != null;
      notifyListeners();
    } catch (e) {
      _message = "Failed to load your data";
      notifyListeners();
    }
  }
}
