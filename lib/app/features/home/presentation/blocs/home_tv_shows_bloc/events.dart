part of 'bloc.dart';

sealed class HomeTvShowsEvent extends Equatable {
  const HomeTvShowsEvent();

  @override
  List<Object> get props => [];
}

class FetchTvShowsEvent extends HomeTvShowsEvent {}

class OnTvShowClickedEvent extends HomeTvShowsEvent {}
