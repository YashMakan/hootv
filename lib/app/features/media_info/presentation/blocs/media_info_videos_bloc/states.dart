part of 'bloc.dart';

@immutable
sealed class MediaInfoVideosState extends Equatable {
  const MediaInfoVideosState();

  @override
  List<Object> get props => [];
}

class MediaInfoActionState extends MediaInfoVideosState {}

class MediaInfoInitialState extends MediaInfoVideosState {}

class MediaInfoLoadingState extends MediaInfoVideosState {}

class MovieVideosLoadedState extends MediaInfoVideosState {
  final List<YouTubeVideoModel> videos;

  const MovieVideosLoadedState(this.videos);
}

class TvShowVideosLoadedState extends MediaInfoVideosState {
  final List<YouTubeVideoModel> videos;

  const TvShowVideosLoadedState(this.videos);
}

class MediaInfoErrorActionState extends MediaInfoActionState {}
