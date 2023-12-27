part of 'bloc.dart';

sealed class HomeContinueWatchingEvent extends Equatable {
  const HomeContinueWatchingEvent();

  @override
  List<Object> get props => [];
}

class FetchContinueWatchingMediasEvent extends HomeContinueWatchingEvent {}

class OnContinueWatchingMediaClickedEvent extends HomeContinueWatchingEvent {}
