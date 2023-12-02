part of 'bloc.dart';

sealed class HomeTrendingEvent extends Equatable {
  const HomeTrendingEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingMoviesEvent extends HomeTrendingEvent {}

class PlayButtonClickedEvent extends HomeTrendingEvent {}

class MyListButtonClickedEvent extends HomeTrendingEvent {}

class MovieBannerClickedEvent extends HomeTrendingEvent {}
