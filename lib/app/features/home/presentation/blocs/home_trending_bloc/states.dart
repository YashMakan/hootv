part of 'bloc.dart';

@immutable
sealed class HomeTrendingState extends Equatable {
  const HomeTrendingState();

  @override
  List<Object> get props => [];
}

class HomeTrendingActionState extends HomeTrendingState {}

class HomeTrendingInitialState extends HomeTrendingState {}

class HomeTrendingLoadingState extends HomeTrendingState {}

class HomeTrendingLoadedState extends HomeTrendingState {
  final List<MovieModel> movies;

  const HomeTrendingLoadedState(this.movies);
}

class HomeTrendingErrorActionState extends HomeTrendingActionState {}

class PlayButtonClickedActionState extends HomeTrendingActionState {}

class MyListButtonClickedActionState extends HomeTrendingActionState {}

class MovieBannerClickedActionState extends HomeTrendingActionState {}
