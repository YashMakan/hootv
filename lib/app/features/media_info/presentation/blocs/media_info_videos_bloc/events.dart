part of 'bloc.dart';

sealed class MediaInfoVideosEvent extends Equatable {
  const MediaInfoVideosEvent();

  @override
  List<Object> get props => [];
}

class FetchMediaVideosEvent extends MediaInfoVideosEvent {
  final MovieModel? movieModel;
  final TvShowModel? tvShowModel;

  const FetchMediaVideosEvent({this.movieModel, this.tvShowModel});
}
