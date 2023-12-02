part of 'bloc.dart';

@immutable
sealed class ReelState extends Equatable {
  const ReelState();

  @override
  List<Object> get props => [];
}

class ReelActionState extends ReelState {}

class ReelInitialState extends ReelState {}

class ReelLoadingState extends ReelState {}

class ReelLoadedState extends ReelState {
  final List<ReelModel> reels;

  const ReelLoadedState(this.reels);
}

class ReelErrorActionState extends ReelActionState {}
