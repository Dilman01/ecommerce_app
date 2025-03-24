part of 'init_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  await _initCore();
  await _initAuth();
  await _initCategories();
  await _initHome();
  await _initSearch();
  await _initCart();
  await _initWishlist();
  await _initAdminCategory();
  await _initAdminProducts();
  await _initAdminUsers();
}

Future<void> _initCore() async {
  sl
    ..registerSingleton<DioClient>(DioClient())
    ..registerLazySingleton(() => InternetConnectionCubit())
    ..registerLazySingleton(() => ThemeCubit())
    ..registerFactory(() => UploadImageCubit(sl()))
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
    ..registerFactory(() => CategoriesBloc(getAllCategoriesUsecase: sl()))
    ..registerFactory(
      () => GetProductsByCategoryBloc(getProductsByCategoryUsecase: sl()),
    );
}

Future<void> _initHome() async {
  sl
    ..registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl(sl()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()))
    ..registerLazySingleton(() => GetLatestProductsUsecase(sl()))
    ..registerFactory(() => LatestProductsBloc(getLatestProductsUsecase: sl()));
}

Future<void> _initSearch() async {
  sl
    ..registerLazySingleton<SearchDataSource>(() => SearchDataSourceImpl(sl()))
    ..registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()))
    ..registerLazySingleton(() => SearchProductsUsecase(sl()))
    ..registerFactory(() => SearchProductsBloc(searchProductsUsecase: sl()));
}

Future<void> _initCart() async {
  sl.registerLazySingleton(() => CartBloc());
}

Future<void> _initWishlist() async {
  sl.registerLazySingleton(() => WishlistCubit());
}

Future<void> _initAdminCategory() async {
  sl
    ..registerLazySingleton<AdminCategoriesDataSource>(
      () => AdminCategoriesDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AdminCategoryRepository>(
      () => AdminCategoryRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetAllAdminCategoriesUsecase(sl()))
    ..registerLazySingleton(() => CreateCategoryUsecase(sl()))
    ..registerLazySingleton(() => UpdateCategoryUsecase(sl()))
    ..registerLazySingleton(() => DeleteCategoryUsecase(sl()))
    ..registerFactory(
      () => GetAllAdminCategoriesBloc(getAllAdminCategoriesUsecase: sl()),
    )
    ..registerFactory(() => CreateCategoryBloc(createCategoryUsecase: sl()))
    ..registerFactory(() => UpdateCategoryBloc(updateCategoryUsecase: sl()))
    ..registerFactory(() => DeleteCategoryBloc(deleteCategoryUsecase: sl()));
}

Future<void> _initAdminProducts() async {
  sl
    ..registerLazySingleton<AdminProductsDataSource>(
      () => AdminProductsDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AdminProductsRepository>(
      () => AdminProductsRepositoryImpl(sl()),
    )
    ..registerLazySingleton(() => GetAllAdminProductsUsecase(sl()))
    ..registerLazySingleton(() => CreateProductUsecase(sl()))
    ..registerLazySingleton(() => UpdateProductUsecase(sl()))
    ..registerLazySingleton(() => DeleteProductUsecase(sl()))
    ..registerFactory(
      () => GetAllAdminProductsBloc(getAllAdminProductsUsecase: sl()),
    )
    ..registerFactory(() => CreateProductBloc(createProductUsecase: sl()))
    ..registerFactory(() => UpdateProductBloc(updateProductUsecase: sl()))
    ..registerFactory(() => DeleteProductBloc(deleteProductUsecase: sl()));
}

Future<void> _initAdminUsers() async {
  sl
    ..registerLazySingleton<UsersDataSource>(() => UsersDataSourceImpl(sl()))
    ..registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(sl()))
    ..registerLazySingleton(() => GetAllUsersUsecase(sl()))
    ..registerLazySingleton(() => DeleteUserUsecase(sl()))
    ..registerFactory(() => GetAllUsersBloc(getAllUsersUsecase: sl()))
    ..registerFactory(() => DeleteUserBloc(deleteUserUsecase: sl()));
}
