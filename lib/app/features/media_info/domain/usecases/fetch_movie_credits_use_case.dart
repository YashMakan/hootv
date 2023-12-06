import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/media_info/data/models/credits_model.dart';
import 'package:hootv/app/features/media_info/data/repository_impl/media_info_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class FetchMovieCreditsUseCase {
  final MediaInfoRepositoryImpl mediaInfoRepository;

  FetchMovieCreditsUseCase(this.mediaInfoRepository);

  Future<Either<ErrorState, List<CreditsModel>>> call(int movieId) async {
    return await mediaInfoRepository.fetchMovieCredits(movieId);
  }
}
