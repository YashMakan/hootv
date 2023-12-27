import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_data_source.g.dart';

@RestApi()
abstract class HomeDataSource {
  factory HomeDataSource(Dio dio) = _HomeDataSource;

  @GET('/v1/movies/trending')
  Future<HttpResponse> fetchTrendingMovies(@Body() Map<String, dynamic> data);

  @GET('/v1/movies/new')
  Future<HttpResponse> fetchNewOnMoviesUseCase(
      @Body() Map<String, dynamic> data);

  @GET('/v1/tv-show/trending')
  Future<HttpResponse> fetchTrendingTvShows(@Body() Map<String, dynamic> data);
}
