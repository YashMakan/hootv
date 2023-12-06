part of 'bloc.dart';

sealed class MediaInfoEvent extends Equatable {
  const MediaInfoEvent();

  @override
  List<Object> get props => [];
}

class FetchMediaInfoEvent extends MediaInfoEvent {
  final MovieModel? movieModel;
  final TvShowModel? tvShowModel;

  const FetchMediaInfoEvent({this.movieModel, this.tvShowModel});
}
