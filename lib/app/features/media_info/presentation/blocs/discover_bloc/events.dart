part of 'bloc.dart';

sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingMediaEvent extends DiscoverEvent {}
