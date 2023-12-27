import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/discover/data/repository_impl/discover_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';

class SearchForMediasUseCase {
  final DiscoverRepositoryImpl discoverRepository;

  SearchForMediasUseCase(this.discoverRepository);

  Future<Either<ErrorState, List<MediaModel>>> call(String query) async {
    return await discoverRepository.searchForMedias(query);
  }
}
