import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/models/movie_info_model.dart';
import 'package:hootv/app/features/media_info/data/repository_impl/media_info_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class FetchMovieInfoUseCase {
  final MediaInfoRepositoryImpl mediaInfoRepository;

  FetchMovieInfoUseCase(this.mediaInfoRepository);

  Future<Either<ErrorState, MovieInfoModel>> call(int movieId) async {
    return await mediaInfoRepository.fetchMovieInfo(movieId);
  }
}
