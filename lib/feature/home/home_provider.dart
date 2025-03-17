import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/feature/home/home_state.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  HomeProvider(this._cafeRepository);

  HomeState _state = HomeListNoneState();
  HomeState get state => _state;

  Future<void> getCafeList() async {
    try {
      _state = HomeListLoadingState();
      notifyListeners();

      final result = await _cafeRepository.getList();
      _state = HomeListLoadedState(result);
      notifyListeners();
    } on Exception catch (e) {
      _state = HomeListErrorState(e.toString());
      notifyListeners();
    }
  }

  Future<void> getSearchList(String value) async {
    try {
      if (value.isEmpty) {
        getCafeList();
      } else {
        _state = HomeListLoadingState();
        notifyListeners();

        final result = await _cafeRepository.getSearch(value);
        _state = HomeListLoadedState(result);
        notifyListeners();
      }
    } on Exception catch (e) {
      _state = HomeListErrorState(e.toString());
      notifyListeners();
    }
  }
}
