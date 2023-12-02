import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'reel_data_source.g.dart';

@RestApi()
abstract class ReelDataSource {
  factory ReelDataSource(Dio dio) = _ReelDataSource;

  @GET('/v1/reels/all')
  Future<HttpResponse> fetchReels(@Body() Map<String, dynamic> data);
}
