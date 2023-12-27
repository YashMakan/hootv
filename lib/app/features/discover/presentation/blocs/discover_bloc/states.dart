part of 'bloc.dart';

@immutable
sealed class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

class DiscoverActionState extends DiscoverState {}

class DiscoverInitialState extends DiscoverState {}

class DiscoverLoadingState extends DiscoverState {}

class DiscoverLoadedState extends DiscoverState {
  final List<MediaModel> medias;

  const DiscoverLoadedState(this.medias);
}

class DiscoverErrorActionState extends DiscoverActionState {}
