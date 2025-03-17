import 'package:amary_cafe/data/api/model/detail.dart';

sealed class DetailState {}

class DetailNoneState extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailErrorState extends DetailState {
  final String error;

  DetailErrorState(this.error);
}

class DetailLoadedState extends DetailState {
  final Detail data;

  DetailLoadedState(this.data);
}
