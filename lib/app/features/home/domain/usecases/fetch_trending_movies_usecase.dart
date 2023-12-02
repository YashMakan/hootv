import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

class FetchTrendingMoviesUseCase {
  final HomeRepositoryImpl homeRepository;

  FetchTrendingMoviesUseCase(this.homeRepository);

  Future<Either<ErrorState, List<MovieModel>>> call(
      Map<String, dynamic> data) async {
    return await homeRepository.fetchTrendingMovies(data);
  }
}
