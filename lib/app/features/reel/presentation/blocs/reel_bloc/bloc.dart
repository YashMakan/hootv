import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/reel/domain/entities/reel_model.dart';
import 'package:hootv/app/features/reel/domain/usecases/fetch_reels_usecase.dart';

part 'events.dart';
part 'states.dart';

class ReelBloc extends Bloc<ReelEvent, ReelState> {
  final FetchReelsUseCase fetchReelsUseCase;

  ReelBloc(this.fetchReelsUseCase) : super(ReelInitialState()) {
    on<FetchReelsEvent>(fetchReelsEvent);
  }

  Future<FutureOr<void>> fetchReelsEvent(
      FetchReelsEvent event, Emitter<ReelState> emit) async {
    emit(ReelLoadingState());
    final result = await fetchReelsUseCase({});
    if (result.isLeft()) {
      emit(ReelErrorActionState());
    } else {
      List<ReelModel> r = result.getOrElse(() => []);
      // List<ReelModel> results = await Future.wait(r.take(3).map((e) async {
      //   final yt = YoutubeExplode();
      //   var manifest = await yt.videos.streamsClient.getManifest(e.id);
      //   final streamInfo = manifest.muxed.withHighestBitrate();
      //   return e.copyWith(videoUrl: streamInfo.url.toString());
      // }));
      emit(ReelLoadedState(r));
    }
  }
}
