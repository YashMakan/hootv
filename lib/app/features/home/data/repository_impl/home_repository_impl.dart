import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/home/data/data_sources/home_data_source.dart';
import 'package:hootv/app/features/home/domain/repository/home_repository.dart';
import 'package:hootv/app/shared/core/error_handler/error_handler.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(this.homeDataSource);

  @override
  Future<Either<ErrorState, List<MovieModel>>> fetchTrendingMovies(
      Map<String, dynamic> data) async {
    return await ErrorHandler.callApi(
        () => homeDataSource.fetchTrendingMovies(data), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => MovieModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<ErrorState, List<MovieModel>>> fetchNewOnMoviesUseCase(
      Map<String, dynamic> data) async {
    return await ErrorHandler.callApi(
        () => homeDataSource.fetchNewOnMoviesUseCase(data), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => MovieModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<ErrorState, List<TvShowModel>>> fetchTrendingTvShows(
      Map<String, dynamic> data) async {
    return await ErrorHandler.callApi(
        () => homeDataSource.fetchTrendingTvShows(data), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => TvShowModel.fromJson(e)).toList();
    });
  }
}
