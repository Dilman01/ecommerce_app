part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await _initCore();
  await _initAuth();
}

Future<void> _initCore() async {
  sl.registerSingleton<DioClient>(DioClient());
}

Future<void> _initAuth() async {
  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton(() => UserSignup(sl()))
    ..registerLazySingleton(() => AuthBloc(userSignup: sl()));
}
