import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_trending_movies_usecase.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

part 'events.dart';

part 'states.dart';

class HomeContinueWatchingBloc
    extends Bloc<HomeContinueWatchingEvent, HomeContinueWatchingState> {
  final FetchTrendingMoviesUseCase fetchTrendingMoviesUseCase;

  HomeContinueWatchingBloc(this.fetchTrendingMoviesUseCase)
      : super(HomeContinueWatchingInitialState()) {
    on<FetchContinueWatchingMediasEvent>(fetchContinueWatchingMediasEvent);

    on<OnContinueWatchingMediaClickedEvent>(
        onContinueWatchingMediaClickedEvent);
  }

  Future<FutureOr<void>> fetchContinueWatchingMediasEvent(
      FetchContinueWatchingMediasEvent event,
      Emitter<HomeContinueWatchingState> emit) async {
    emit(HomeContinueWatchingLoadingState());
    final result = await fetchTrendingMoviesUseCase({});
    result.fold((l) {
      emit(HomeContinueWatchingErrorActionState());
    }, (r) {
      emit(HomeContinueWatchingLoadedState(r));
    });
  }

  FutureOr<void> onContinueWatchingMediaClickedEvent(
      OnContinueWatchingMediaClickedEvent event,
      Emitter<HomeContinueWatchingState> emit) {}
}
