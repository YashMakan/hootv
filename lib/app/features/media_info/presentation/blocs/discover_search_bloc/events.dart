part of 'bloc.dart';

sealed class DiscoverSearchEvent extends Equatable {
  const DiscoverSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchForMediasEvent extends DiscoverSearchEvent {
  final String query;

  const SearchForMediasEvent(this.query);
}

class ResetMediasEvent extends DiscoverSearchEvent {}
