part of 'bloc.dart';

@immutable
sealed class HomeContinueWatchingState extends Equatable {
  const HomeContinueWatchingState();

  @override
  List<Object> get props => [];
}

class HomeContinueWatchingActionState extends HomeContinueWatchingState {}

class HomeContinueWatchingInitialState extends HomeContinueWatchingState {}

class HomeContinueWatchingLoadingState extends HomeContinueWatchingState {}

class HomeContinueWatchingLoadedState extends HomeContinueWatchingState {
  final List<MovieModel> movies;

  const HomeContinueWatchingLoadedState(this.movies);
}

class HomeContinueWatchingErrorActionState
    extends HomeContinueWatchingActionState {}
