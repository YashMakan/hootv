import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/models/credits_model.dart';
import 'package:hootv/app/features/media_info/data/models/movie_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/tv_show_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/youtube_video_model.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

abstract class MediaInfoRepository {
  Future<Either<ErrorState, MovieInfoModel>> fetchMovieInfo(int movieId);

  Future<Either<ErrorState, TvShowInfoModel>> fetchTvShowInfo(int tvShowId);

  Future<Either<ErrorState, List<YouTubeVideoModel>>> fetchMovieVideos(
      int movieId);

  Future<Either<ErrorState, List<YouTubeVideoModel>>> fetchTvShowVideos(
      int tvShowId);

  Future<Either<ErrorState, List<CreditsModel>>> fetchMovieCredits(int movieId);

  Future<Either<ErrorState, List<CreditsModel>>> fetchTvShowCredits(
      int tvShowId);
}
