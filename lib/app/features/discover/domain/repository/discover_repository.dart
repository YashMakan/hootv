import 'package:dartz/dartz.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';

abstract class DiscoverRepository {
  Future<Either<ErrorState, List<MediaModel>>> fetchTrendingMedias(
      Map<String, dynamic> data);

  Future<Either<ErrorState, List<MediaModel>>> searchForMedias(String query);
}
