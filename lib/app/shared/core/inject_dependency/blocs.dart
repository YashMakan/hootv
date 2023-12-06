part of 'dependencies.dart';

Future<void> injectBlocs() async {
  sl.registerSingleton(HomeTrendingBloc(sl()));
  sl.registerSingleton(HomeContinueWatchingBloc(sl()));
  sl.registerSingleton(HomeNewOnBloc(sl()));
  sl.registerSingleton(HomeTvShowsBloc(sl()));

  sl.registerSingleton(ReelBloc(sl()));

  sl.registerSingleton(DiscoverBloc(sl()));
  sl.registerSingleton(DiscoverSearchBloc(sl()));

  sl.registerSingleton(MediaInfoBloc(sl(), sl()));
  sl.registerSingleton(MediaInfoVideosBloc(sl(), sl()));
  sl.registerSingleton(MediaCreditsBloc(sl(), sl()));
}
