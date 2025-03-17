import 'package:amary_cafe/data/api/model/cafe.dart';

sealed class HomeState {}

class HomeListNoneState extends HomeState {}

class HomeListLoadingState extends HomeState {}

class HomeListErrorState extends HomeState {
  final String error;

  HomeListErrorState(this.error);
}

class HomeListLoadedState extends HomeState {
  final List<Cafe> data;

  HomeListLoadedState(this.data);
}
