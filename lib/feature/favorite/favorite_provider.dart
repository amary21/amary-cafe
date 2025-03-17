import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/feature/favorite/favorite_state.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  FavoriteProvider(this._cafeRepository);

  FavoriteState _state = FavoriteNoneState();
  FavoriteState get state => _state;

  Future<void> getFavorite() async {
    try {
      _state = FavoriteLoadingState();
      notifyListeners();

      final result = await _cafeRepository.localGetAllItem();
      _state = FavoriteLoadedState(result);
      notifyListeners();
    } on Exception catch (e) {
      _state = FavoriteErrorState(e.toString());
      notifyListeners();
    }
  }
}
