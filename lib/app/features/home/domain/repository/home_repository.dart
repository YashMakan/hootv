import 'package:dartz/dartz.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

abstract class HomeRepository {
  Future<Either<ErrorState, List<MovieModel>>> fetchTrendingMovies(
      Map<String, dynamic> data);

  Future<Either<ErrorState, List<MovieModel>>> fetchNewOnMoviesUseCase(
      Map<String, dynamic> data);

  Future<Either<ErrorState, List<TvShowModel>>> fetchTrendingTvShows(
      Map<String, dynamic> data);
}
