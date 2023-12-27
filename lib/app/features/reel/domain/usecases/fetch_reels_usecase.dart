import 'package:dartz/dartz.dart';
import 'package:hootv/app/features/reel/data/repository_impl/reel_repository_impl.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_model.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';

class FetchReelsUseCase {
  final ReelRepositoryImpl reelRepository;

  FetchReelsUseCase(this.reelRepository);

  Future<Either<ErrorState, List<ReelModel>>> call(
      Map<String, dynamic> data) async {
    return await reelRepository.fetchReels(data);
  }
}
