import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/discover/data/repository_impl/discover_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';

class FetchTrendingMediaUseCase {
  final DiscoverRepositoryImpl discoverRepository;

  FetchTrendingMediaUseCase(this.discoverRepository);

  Future<Either<ErrorState, List<MediaModel>>> call(
      Map<String, dynamic> data) async {
    return await discoverRepository.fetchTrendingMedias(data);
  }
}
