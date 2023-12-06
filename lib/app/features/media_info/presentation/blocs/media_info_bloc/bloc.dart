import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/movie_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/tv_show_info_model.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_movie_info_use_case.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_tv_show_info_use_case.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

part 'events.dart';

part 'states.dart';

class MediaInfoBloc
    extends Bloc<MediaInfoEvent, MediaInfoState> {
  final FetchMovieInfoUseCase fetchMovieInfoUseCase;
  final FetchTvShowInfoUseCase fetchTvShowInfoUseCase;

  MediaInfoBloc(this.fetchMovieInfoUseCase, this.fetchTvShowInfoUseCase)
      : super(MediaInfoInitialState()) {
    on<FetchMediaInfoEvent>(fetchMediaInfoEvent);
  }

  Future<FutureOr<void>> fetchMediaInfoEvent(
      FetchMediaInfoEvent event,
      Emitter<MediaInfoState> emit) async {
    emit(MediaInfoLoadingState());
    if(event.movieModel != null) {
      final result = await fetchMovieInfoUseCase(event.movieModel!.id);
      result.fold((l) {
        emit(MediaInfoErrorActionState());
      }, (r) {
        emit(MovieInfoLoadedState(r));
      });
    } else {
      final result = await fetchTvShowInfoUseCase(event.tvShowModel!.id);
      result.fold((l) {
        emit(MediaInfoErrorActionState());
      }, (r) {
        emit(TvShowInfoLoadedState(r));
      });
    }
  }
}
