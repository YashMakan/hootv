import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'discover_data_source.g.dart';

@RestApi()
abstract class DiscoverDataSource {
  factory DiscoverDataSource(Dio dio) = _DiscoverDataSource;

  @GET('/v1/medias/trending')
  Future<HttpResponse> fetchTrendingMedias(@Body() Map<String, dynamic> data);

  @POST('/v1/medias/search')
  Future<HttpResponse> searchForMedias(@Field("query") String query);
}
