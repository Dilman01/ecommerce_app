part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await _initCore();
  await _initAuth();
  await _initCategories();
}

Future<void> _initCore() async {
  sl
    ..registerSingleton<DioClient>(DioClient())
    ..registerLazySingleton(() => ThemeCubit())
    ..registerLazySingleton(() => UploadImageCubit(sl()))
    ..registerLazySingleton<UploadImageDataSource>(
      () => UploadImageDataSourceImpl(sl()),
    )
    ..registerLazySingleton<UploadImageRepo>(() => UploadImageRepoImpl(sl()));
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

Future<void> _initCategories() async {
  sl
    ..registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetAllCategoriesUsecase(sl()))
    ..registerLazySingleton(() => GetProductsByCategoryUsecase(sl()))
    ..registerLazySingleton(() => CategoriesBloc(getAllCategoriesUsecase: sl()))
    ..registerLazySingleton(
      () => GetProductsByCategoryBloc(getProductsByCategoryUsecase: sl()),
    );
}
