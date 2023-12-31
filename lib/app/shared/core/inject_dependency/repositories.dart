part of 'dependencies.dart';

Future<void> injectRepositories() async {
  sl.registerSingleton(HomeRepositoryImpl(sl()));
  sl.registerSingleton(ReelRepositoryImpl(sl()));
  sl.registerSingleton(DiscoverRepositoryImpl(sl()));
  sl.registerSingleton(MediaInfoRepositoryImpl(sl()));
}
