import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/discover/data/data_sources/discover_data_source.dart';
import 'package:hootv/app/features/discover/domain/repository/discover_repository.dart';
import 'package:hootv/app/shared/core/error_handler/error_handler.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';

class DiscoverRepositoryImpl extends DiscoverRepository {
  final DiscoverDataSource discoverDataSource;

  DiscoverRepositoryImpl(this.discoverDataSource);

  @override
  Future<Either<ErrorState, List<MediaModel>>> fetchTrendingMedias(
      Map<String, dynamic> data) async {
    return await ErrorHandler.callApi(
        () => discoverDataSource.fetchTrendingMedias(data), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => MediaModel.fromJson(e)).toList();
    });
  }

  @override
  Future<Either<ErrorState, List<MediaModel>>> searchForMedias(
      String query) async {
    return await ErrorHandler.callApi(
        () => discoverDataSource.searchForMedias(query), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => MediaModel.fromJson(e)).toList();
    });
  }
}
