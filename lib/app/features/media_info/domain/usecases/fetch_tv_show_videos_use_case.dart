import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/models/youtube_video_model.dart';
import 'package:hootv/app/features/media_info/data/repository_impl/media_info_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class FetchTvShowVideosUseCase {
  final MediaInfoRepositoryImpl mediaInfoRepository;

  FetchTvShowVideosUseCase(this.mediaInfoRepository);

  Future<Either<ErrorState, List<YouTubeVideoModel>>> call(int showId) async {
    return await mediaInfoRepository.fetchTvShowVideos(showId);
  }
}
