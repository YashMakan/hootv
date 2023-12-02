import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hootv/app/features/home/data/data_sources/home_data_source.dart';
import 'package:hootv/app/features/home/data/repository_impl/home_repository_impl.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_new_on_movies_usecase.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_trending_movies_usecase.dart';
import 'package:hootv/app/features/home/domain/usecases/fetch_trending_tv_shows_use_case.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_continue_watching_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_new_on_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_trending_bloc/bloc.dart';
import 'package:hootv/app/features/home/presentation/blocs/home_tv_shows_bloc/bloc.dart';
import 'package:hootv/app/features/reel/data/data_sources/reel_data_source.dart';
import 'package:hootv/app/features/reel/data/repository_impl/reel_repository_impl.dart';
import 'package:hootv/app/features/reel/domain/usecases/fetch_reels_usecase.dart';
import 'package:hootv/app/features/reel/presentation/blocs/reel_bloc/bloc.dart';
import 'package:hootv/app/shared/core/interceptors/dio_interceptor.dart';

part 'api_sources.dart';
part 'blocs.dart';
part 'repositories.dart';
part 'usecases.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(customDio());
  injectApiSources();
  injectRepositories();
  injectUseCases();
  injectBlocs();
}
