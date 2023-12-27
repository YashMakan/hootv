part of 'bloc.dart';

@immutable
sealed class DiscoverSearchState extends Equatable {
  const DiscoverSearchState();

  @override
  List<Object> get props => [];
}

class DiscoverSearchActionState extends DiscoverSearchState {}

class DiscoverSearchInitialState extends DiscoverSearchState {}

class DiscoverSearchLoadingState extends DiscoverSearchState {}

class DiscoverSearchLoadedState extends DiscoverSearchState {
  final List<MediaModel> medias;

  const DiscoverSearchLoadedState(this.medias);
}

class DiscoverSearchErrorActionState extends DiscoverSearchActionState {}
