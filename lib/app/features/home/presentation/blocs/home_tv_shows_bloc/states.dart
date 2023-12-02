part of 'bloc.dart';

@immutable
sealed class HomeTvShowsState extends Equatable {
  const HomeTvShowsState();

  @override
  List<Object> get props => [];
}

class HomeTvShowsActionState extends HomeTvShowsState {}

class HomeTvShowsInitialState extends HomeTvShowsState {}

class HomeTvShowsLoadingState extends HomeTvShowsState {}

class HomeTvShowsLoadedState extends HomeTvShowsState {
  final List<TvShowModel> tvShows;

  const HomeTvShowsLoadedState(this.tvShows);
}

class HomeTvShowsErrorActionState extends HomeTvShowsActionState {}
