part of 'bloc.dart';

@immutable
sealed class MediaCreditsState extends Equatable {
  const MediaCreditsState();

  @override
  List<Object> get props => [];
}

class MediaCreditsActionState extends MediaCreditsState {}

class MediaCreditsInitialState extends MediaCreditsState {}

class MediaCreditsLoadingState extends MediaCreditsState {}

class MediaCreditsLoadedState extends MediaCreditsState {
  final List<CreditsModel> credits;

  const MediaCreditsLoadedState(this.credits);
}

class MediaCreditsErrorActionState extends MediaCreditsActionState {}
