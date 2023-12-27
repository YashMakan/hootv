part of 'bloc.dart';

sealed class ReelEvent extends Equatable {
  const ReelEvent();

  @override
  List<Object> get props => [];
}

class FetchReelsEvent extends ReelEvent {}
