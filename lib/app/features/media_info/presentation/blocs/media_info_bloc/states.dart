part of 'bloc.dart';

@immutable
sealed class MediaInfoState extends Equatable {
  const MediaInfoState();

  @override
  List<Object> get props => [];
}

class MediaInfoActionState extends MediaInfoState {}

class MediaInfoInitialState extends MediaInfoState {}

class MediaInfoLoadingState extends MediaInfoState {}

class MovieInfoLoadedState extends MediaInfoState {
  final MovieInfoModel mediaInfo;

  const MovieInfoLoadedState(this.mediaInfo);
}

class TvShowInfoLoadedState extends MediaInfoState {
  final TvShowInfoModel tvShowInfo;

  const TvShowInfoLoadedState(this.tvShowInfo);
}

class MediaInfoErrorActionState extends MediaInfoActionState {}
