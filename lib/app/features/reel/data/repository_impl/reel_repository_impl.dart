import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/reel/data/data_sources/reel_data_source.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_model.dart';
import 'package:hootv/app/features/reel/domain/repository/reel_repository.dart';
import 'package:hootv/app/shared/core/error_handler/error_handler.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class ReelRepositoryImpl extends ReelRepository {
  final ReelDataSource reelDataSource;

  ReelRepositoryImpl(this.reelDataSource);
  @override
  Future<Either<ErrorState, List<ReelModel>>> fetchReels(
      Map<String, dynamic> data) async {
    return await ErrorHandler.callApi(
            () => reelDataSource.fetchReels(data), (result) {
      final res = (result['result'] as List<dynamic>);
      return res.map((e) => ReelModel.fromJson(e)).toList();
    });
  }
}
