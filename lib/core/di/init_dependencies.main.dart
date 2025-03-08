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
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()),
    )
    ..registerLazySingleton(() => UserSignup(sl()))
    ..registerLazySingleton(() => UserLogin(sl()))
    ..registerLazySingleton(() => UserProfile(sl()))
    ..registerLazySingleton(() => UserLogout(sl()))
    ..registerLazySingleton(
      () => AuthBloc(
        userSignup: sl(),
        userLogin: sl(),
        userProfile: sl(),
        userLogout: sl(),
      ),
    );
}
