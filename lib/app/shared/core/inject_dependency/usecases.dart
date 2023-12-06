part of 'dependencies.dart';

Future<void> injectUseCases() async {
  sl.registerSingleton(FetchTrendingMoviesUseCase(sl()));
  sl.registerSingleton(FetchNewOnMoviesUseCase(sl()));
  sl.registerSingleton(FetchTrendingTvShowsUseCase(sl()));
  sl.registerSingleton(FetchReelsUseCase(sl()));
  sl.registerSingleton(FetchTrendingMediaUseCase(sl()));
  sl.registerSingleton(SearchForMediasUseCase(sl()));
  sl.registerSingleton(FetchMovieInfoUseCase(sl()));
  sl.registerSingleton(FetchTvShowInfoUseCase(sl()));
  sl.registerSingleton(FetchMovieVideosUseCase(sl()));
  sl.registerSingleton(FetchTvShowVideosUseCase(sl()));
  sl.registerSingleton(FetchMovieCreditsUseCase(sl()));
  sl.registerSingleton(FetchTvShowCreditsUseCase(sl()));
}
