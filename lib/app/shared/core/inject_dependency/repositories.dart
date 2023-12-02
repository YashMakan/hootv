part of 'dependencies.dart';

Future<void> injectRepositories() async {
  sl.registerSingleton(HomeRepositoryImpl(sl()));
  sl.registerSingleton(ReelRepositoryImpl(sl()));
}
