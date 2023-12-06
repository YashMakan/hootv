part of 'bloc.dart';

sealed class MediaCreditsEvent extends Equatable {
  const MediaCreditsEvent();

  @override
  List<Object> get props => [];
}

class FetchMediaCreditsEvent extends MediaCreditsEvent {
  final MovieModel? movieModel;
  final TvShowModel? tvShowModel;

  const FetchMediaCreditsEvent({this.movieModel, this.tvShowModel});
}
