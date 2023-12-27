import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/credits_model.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_movie_credits_use_case.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_tv_show_credits_use_case.dart';
import 'package:hootv/app/shared/core/error_handler/error_state.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

part 'events.dart';
part 'states.dart';

class MediaCreditsBloc extends Bloc<MediaCreditsEvent, MediaCreditsState> {
  final FetchMovieCreditsUseCase fetchMovieCreditsUseCase;
  final FetchTvShowCreditsUseCase fetchTvShowCreditsUseCase;

  MediaCreditsBloc(
      this.fetchMovieCreditsUseCase, this.fetchTvShowCreditsUseCase)
      : super(MediaCreditsInitialState()) {
    on<FetchMediaCreditsEvent>(fetchMediaCreditsEvent);
  }

  Future<FutureOr<void>> fetchMediaCreditsEvent(
      FetchMediaCreditsEvent event, Emitter<MediaCreditsState> emit) async {
    emit(MediaCreditsLoadingState());
    Either<ErrorState, List<CreditsModel>> result;
    if (event.movieModel != null) {
      result = await fetchMovieCreditsUseCase(event.movieModel!.id);
    } else {
      result = await fetchTvShowCreditsUseCase(event.tvShowModel!.id);
    }
    result.fold((l) {
      emit(MediaCreditsErrorActionState());
    }, (r) {
      emit(MediaCreditsLoadedState(r));
    });
  }
}
