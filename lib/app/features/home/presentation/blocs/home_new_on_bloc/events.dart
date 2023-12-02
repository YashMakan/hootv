part of 'bloc.dart';

sealed class HomeNewOnEvent extends Equatable {
  const HomeNewOnEvent();

  @override
  List<Object> get props => [];
}

class FetchNewOnMediasEvent extends HomeNewOnEvent {}

class OnNewOnMediaClickedEvent extends HomeNewOnEvent {}
