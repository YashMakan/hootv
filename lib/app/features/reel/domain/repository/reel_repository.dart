import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_model.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

abstract class ReelRepository {
  Future<Either<ErrorState, List<ReelModel>>> fetchReels(
      Map<String, dynamic> data);
}
