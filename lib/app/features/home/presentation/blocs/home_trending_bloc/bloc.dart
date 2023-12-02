import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_trending_movies_usecase.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

part 'events.dart';
part 'states.dart';

class HomeTrendingBloc extends Bloc<HomeTrendingEvent, HomeTrendingState> {
  final FetchTrendingMoviesUseCase fetchTrendingMoviesUseCase;

  HomeTrendingBloc(this.fetchTrendingMoviesUseCase)
      : super(HomeTrendingInitialState()) {
    on<FetchTrendingMoviesEvent>(fetchTrendingMoviesEvent);

    on<PlayButtonClickedEvent>(playButtonClickedEvent);

    on<MyListButtonClickedEvent>(myListButtonClickedEvent);

    on<MovieBannerClickedEvent>(movieBannerClickedEvent);
  }

  Future<FutureOr<void>> fetchTrendingMoviesEvent(
      FetchTrendingMoviesEvent event, Emitter<HomeTrendingState> emit) async {
    emit(HomeTrendingLoadingState());
    final result = await fetchTrendingMoviesUseCase({});
    result.fold((l) {
      emit(HomeTrendingErrorActionState());
    }, (r) {
      print(r.length);
      emit(HomeTrendingLoadedState(r));
    });
  }

  FutureOr<void> playButtonClickedEvent(
      PlayButtonClickedEvent event, Emitter<HomeTrendingState> emit) {}

  FutureOr<void> myListButtonClickedEvent(
      MyListButtonClickedEvent event, Emitter<HomeTrendingState> emit) {}

  FutureOr<void> movieBannerClickedEvent(
      MovieBannerClickedEvent event, Emitter<HomeTrendingState> emit) {}
}
