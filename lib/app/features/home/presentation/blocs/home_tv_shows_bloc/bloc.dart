import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_trending_tv_shows_use_case.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

part 'events.dart';
part 'states.dart';

class HomeTvShowsBloc extends Bloc<HomeTvShowsEvent, HomeTvShowsState> {
  final FetchTrendingTvShowsUseCase fetchTrendingTvShowsUseCase;

  HomeTvShowsBloc(this.fetchTrendingTvShowsUseCase)
      : super(HomeTvShowsInitialState()) {
    on<FetchTvShowsEvent>(fetchTvShowsEvent);

    on<OnTvShowClickedEvent>(onTvShowClickedEvent);
  }

  Future<FutureOr<void>> fetchTvShowsEvent(
      FetchTvShowsEvent event, Emitter<HomeTvShowsState> emit) async {
    emit(HomeTvShowsLoadingState());
    final result = await fetchTrendingTvShowsUseCase({});
    result.fold((l) {
      emit(HomeTvShowsErrorActionState());
    }, (r) {
      emit(HomeTvShowsLoadedState(r));
    });
  }

  FutureOr<void> onTvShowClickedEvent(
      OnTvShowClickedEvent event, Emitter<HomeTvShowsState> emit) {}
}
