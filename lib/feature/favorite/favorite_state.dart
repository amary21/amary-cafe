import 'package:amary_cafe/data/api/model/cafe.dart';

sealed class FavoriteState {}

class FavoriteNoneState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteErrorState extends FavoriteState {
  final String error;

  FavoriteErrorState(this.error);
}

class FavoriteLoadedState extends FavoriteState {
  final List<Cafe> data;

  FavoriteLoadedState(this.data);
}