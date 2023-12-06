import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/models/tv_show_info_model.dart';
import 'package:hootv/app/features/media_info/data/repository_impl/media_info_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class FetchTvShowInfoUseCase {
  final MediaInfoRepositoryImpl mediaInfoRepository;

  FetchTvShowInfoUseCase(this.mediaInfoRepository);

  Future<Either<ErrorState, TvShowInfoModel>> call(int movieId) async {
    return await mediaInfoRepository.fetchTvShowInfo(movieId);
  }
}
