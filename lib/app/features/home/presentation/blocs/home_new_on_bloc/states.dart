part of 'bloc.dart';

@immutable
sealed class HomeNewOnState extends Equatable {
  const HomeNewOnState();

  @override
  List<Object> get props => [];
}

class HomeNewOnActionState extends HomeNewOnState {}

class HomeNewOnInitialState extends HomeNewOnState {}

class HomeNewOnLoadingState extends HomeNewOnState {}

class HomeNewOnLoadedState extends HomeNewOnState {
  final List<MovieModel> movies;

  const HomeNewOnLoadedState(this.movies);
}

class HomeNewOnErrorActionState extends HomeNewOnActionState {}
