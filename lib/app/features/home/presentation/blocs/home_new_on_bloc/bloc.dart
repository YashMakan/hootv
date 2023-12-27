import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_new_on_movies_usecase.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

part 'events.dart';
part 'states.dart';

class HomeNewOnBloc extends Bloc<HomeNewOnEvent, HomeNewOnState> {
  final FetchNewOnMoviesUseCase fetchNewOnMoviesUseCase;

  HomeNewOnBloc(this.fetchNewOnMoviesUseCase) : super(HomeNewOnInitialState()) {
    on<FetchNewOnMediasEvent>(fetchNewOnMediasEvent);

    on<OnNewOnMediaClickedEvent>(onNewOnMediaClickedEvent);
  }

  Future<FutureOr<void>> fetchNewOnMediasEvent(
      FetchNewOnMediasEvent event, Emitter<HomeNewOnState> emit) async {
    emit(HomeNewOnLoadingState());
    final result = await fetchNewOnMoviesUseCase({});
    result.fold((l) {
      emit(HomeNewOnErrorActionState());
    }, (r) {
      emit(HomeNewOnLoadedState(r));
    });
  }

  FutureOr<void> onNewOnMediaClickedEvent(
      OnNewOnMediaClickedEvent event, Emitter<HomeNewOnState> emit) {}
}
