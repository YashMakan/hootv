import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/models/youtube_video_model.dart';
import 'package:hootv/app/features/media_info/data/repository_impl/media_info_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class FetchMovieVideosUseCase {
  final MediaInfoRepositoryImpl mediaInfoRepository;

  FetchMovieVideosUseCase(this.mediaInfoRepository);

  Future<Either<ErrorState, List<YouTubeVideoModel>>> call(int movieId) async {
    return await mediaInfoRepository.fetchMovieVideos(movieId);
  }
}
