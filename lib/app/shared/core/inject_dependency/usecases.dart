part of 'dependencies.dart';

Future<void> injectUseCases() async {
  sl.registerSingleton(FetchTrendingMoviesUseCase(sl()));
  sl.registerSingleton(FetchNewOnMoviesUseCase(sl()));
  sl.registerSingleton(FetchTrendingTvShowsUseCase(sl()));
  sl.registerSingleton(FetchReelsUseCase(sl()));
  sl.registerSingleton(FetchTrendingMediaUseCase(sl()));
  sl.registerSingleton(SearchForMediasUseCase(sl()));
}
