import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'media_info_data_source.g.dart';

@RestApi()
abstract class MediaInfoDataSource {
  factory MediaInfoDataSource(Dio dio) = _MediaInfoDataSource;

  @POST('/v1/movies/info')
  Future<HttpResponse> fetchMovieInfo(@Field("movie_id") int movieId);

  @POST('/v1/tv-show/info')
  Future<HttpResponse> fetchTvShowInfo(@Field("tv_show_id") int showId);

  @POST('/v1/movies/videos')
  Future<HttpResponse> fetchMovieVideos(@Field("movie_id") int movieId);

  @POST('/v1/tv-show/videos')
  Future<HttpResponse> fetchTvShowVideos(@Field("tv_show_id") int showId);

  @POST('/v1/movies/credits')
  Future<HttpResponse> fetchMovieCredits(@Field("movie_id") int movieId);

  @POST('/v1/tv-show/credits')
  Future<HttpResponse> fetchTvShowCredits(@Field("tv_show_id") int showId);
}
