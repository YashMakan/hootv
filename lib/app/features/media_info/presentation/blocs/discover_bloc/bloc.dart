import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/discover/domain/usecases/fetch_trending_media_usecase.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';

part 'events.dart';

part 'states.dart';

class DiscoverBloc
    extends Bloc<DiscoverEvent, DiscoverState> {
  final FetchTrendingMediaUseCase fetchTrendingMediaUseCase;

  DiscoverBloc(this.fetchTrendingMediaUseCase)
      : super(DiscoverInitialState()) {
    on<FetchTrendingMediaEvent>(fetchTrendingMediaEvent);
  }

  Future<FutureOr<void>> fetchTrendingMediaEvent(
      FetchTrendingMediaEvent event,
      Emitter<DiscoverState> emit) async {
    emit(DiscoverLoadingState());
    final result = await fetchTrendingMediaUseCase({});
    result.fold((l) {
      emit(DiscoverErrorActionState());
    }, (r) {
      emit(DiscoverLoadedState(r));
    });
  }
}
