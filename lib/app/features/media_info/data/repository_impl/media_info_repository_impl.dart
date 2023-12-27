import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/data_sources/media_info_data_source.dart';
import 'package:hootv/app/features/media_info/data/models/credits_model.dart';
import 'package:hootv/app/features/media_info/data/models/movie_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/tv_show_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/youtube_video_model.dart';
import 'package:hootv/app/features/media_info/domain/repository/media_info_repository.dart';
import 'package:hootv/app/shared/core/error_handler/error_handler.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class MediaInfoRepositoryImpl extends MediaInfoRepository {
  final MediaInfoDataSource mediaInfoDataSource;

  MediaInfoRepositoryImpl(this.mediaInfoDataSource);

  @override
  Future<Either<ErrorState, MovieInfoModel>> fetchMovieInfo(int movieId) async {
    return await ErrorHandler.callApi(
        () => mediaInfoDataSource.fetchMovieInfo(movieId), (result) {
      final res = result['result'];
      return MovieInfoModel.fromJson(res);
    });
  }

  @override
  Future<Either<ErrorState, TvShowInfoModel>> fetchTvShowInfo(
      int tvShowId) async {
    return await ErrorHandler.callApi(
        () => mediaInfoDataSource.fetchTvShowInfo(tvShowId), (result) {
      final res = result['result'];
      return TvShowInfoModel.fromJson(res);
    });
  }

  @override
  Future<Either<ErrorState, List<YouTubeVideoModel>>> fetchMovieVideos(
      int movieId) async {
    return await ErrorHandler.callApi(
        () => mediaInfoDataSource.fetchMovieVideos(movieId), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => YouTubeVideoModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<ErrorState, List<YouTubeVideoModel>>> fetchTvShowVideos(
      int tvShowId) async {
    return await ErrorHandler.callApi(
        () => mediaInfoDataSource.fetchTvShowVideos(tvShowId), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => YouTubeVideoModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<ErrorState, List<CreditsModel>>> fetchMovieCredits(
      int movieId) async {
    return await ErrorHandler.callApi(
        () => mediaInfoDataSource.fetchMovieCredits(movieId), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => CreditsModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<ErrorState, List<CreditsModel>>> fetchTvShowCredits(
      int tvShowId) async {
    return await ErrorHandler.callApi(
        () => mediaInfoDataSource.fetchTvShowCredits(tvShowId), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => CreditsModel.fromJson(e)).toList();
    });
  }
}
