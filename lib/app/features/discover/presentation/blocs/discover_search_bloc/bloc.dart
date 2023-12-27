import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hootv/app/features/discover/domain/usecases/search_for_medias_usecase.dart';
import 'package:hootv/app/shared/core/models/media_model.dart';

part 'events.dart';
part 'states.dart';

class DiscoverSearchBloc
    extends Bloc<DiscoverSearchEvent, DiscoverSearchState> {
  final SearchForMediasUseCase searchForMediasUseCase;

  DiscoverSearchBloc(this.searchForMediasUseCase)
      : super(DiscoverSearchInitialState()) {
    on<SearchForMediasEvent>(searchForMediasEvent);

    on<ResetMediasEvent>(resetMediasEvent);
  }

  Future<FutureOr<void>> searchForMediasEvent(
      SearchForMediasEvent event, Emitter<DiscoverSearchState> emit) async {
    emit(DiscoverSearchLoadingState());
    final result = await searchForMediasUseCase(event.query);
    result.fold((l) {
      emit(DiscoverSearchErrorActionState());
    }, (r) {
      emit(DiscoverSearchLoadedState(r));
    });
  }

  FutureOr<void> resetMediasEvent(
      ResetMediasEvent event, Emitter<DiscoverSearchState> emit) {
    emit(DiscoverSearchInitialState());
  }
}
