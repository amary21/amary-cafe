import 'package:amary_cafe/data/api/repository/cafe_repository.dart';
import 'package:amary_cafe/feature/detail/detail_state.dart';
import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  final CafeRepository _cafeRepository;

  DetailProvider(this._cafeRepository);

  DetailState _state = DetailNoneState();
  DetailState get state => _state;

  Future<void> getDetail(String id) async {
    try {
      _state = DetailLoadingState();
      notifyListeners();

      final result = await _cafeRepository.getDetail(id);
      _state = DetailLoadedState(result);
      notifyListeners();
    } on Exception catch (e) {
      _state = DetailErrorState(e.toString());
      notifyListeners();
    }
  }
}
