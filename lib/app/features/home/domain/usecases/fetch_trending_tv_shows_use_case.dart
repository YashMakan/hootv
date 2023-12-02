import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

class FetchTrendingTvShowsUseCase {
  final HomeRepositoryImpl homeRepository;

  FetchTrendingTvShowsUseCase(this.homeRepository);

  Future<Either<ErrorState, List<TvShowModel>>> call(
      Map<String, dynamic> data) async {
    return await homeRepository.fetchTrendingTvShows(data);
  }
}
