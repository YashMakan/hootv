import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/media_info/data/models/movie_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/tv_show_info_model.dart';
import 'package:hootv/app/features/media_info/data/models/youtube_video_model.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_movie_info_use_case.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_movie_videos_use_case.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_tv_show_info_use_case.dart';
import 'package:hootv/app/features/media_info/domain/usecases/fetch_tv_show_videos_use_case.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';
import 'package:hootv/app/shared/core/models/tv_show_model.dart';

part 'events.dart';

part 'states.dart';

class MediaInfoVideosBloc
    extends Bloc<MediaInfoVideosEvent, MediaInfoVideosState> {
  final FetchMovieVideosUseCase fetchMovieVideosUseCase;
  final FetchTvShowVideosUseCase fetchTvShowVideosUseCase;

  MediaInfoVideosBloc(this.fetchMovieVideosUseCase, this.fetchTvShowVideosUseCase)
      : super(MediaInfoInitialState()) {
    on<FetchMediaVideosEvent>(fetchMediaVideosEvent);
  }

  Future<FutureOr<void>> fetchMediaVideosEvent(
      FetchMediaVideosEvent event,
      Emitter<MediaInfoVideosState> emit) async {
    emit(MediaInfoLoadingState());
    if(event.movieModel != null) {
      final result = await fetchMovieVideosUseCase(event.movieModel!.id);
      result.fold((l) {
        emit(MediaInfoErrorActionState());
      }, (r) {
        emit(MovieVideosLoadedState(r));
      });
    } else {
      final result = await fetchTvShowVideosUseCase(event.tvShowModel!.id);
      result.fold((l) {
        emit(MediaInfoErrorActionState());
      }, (r) {
        emit(TvShowVideosLoadedState(r));
      });
    }
  }
}
