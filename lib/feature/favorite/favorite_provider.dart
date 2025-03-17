import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/feature/favorite/favorite_state.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  FavoriteProvider(this._cafeRepository);

  FavoriteState _state = FavoriteNoneState();
  FavoriteState get state => _state;

  void getFavorite() {
    _cafeRepository.getList(); //replace with local db
    notifyListeners();
  }
}
