import 'package:ecommerce_app/features/customer/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:get_it/get_it.dart';

import 'package:ecommerce_app/core/common/app/theme_cubit/theme_cubit.dart';
import 'package:ecommerce_app/core/common/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:ecommerce_app/core/common/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:ecommerce_app/core/common/app/upload_image/repo/upload_image_repo.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_login.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_logout.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_profile.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_signup.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/customer/category/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/customer/category/data/repository/categories_repository_impl.dart';
import 'package:ecommerce_app/features/customer/category/domain/repository/categories_repository.dart';
import 'package:ecommerce_app/features/customer/category/domain/usecases/get_all_categories_usecase.dart';
import 'package:ecommerce_app/features/customer/category/domain/usecases/get_products_by_category_usecase.dart';
import 'package:ecommerce_app/features/customer/category/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:ecommerce_app/features/customer/category/presentation/blocs/get_products_by_category_bloc/get_products_by_category_bloc.dart';
import 'package:ecommerce_app/features/customer/home/data/data_source/home_data_source.dart';
import 'package:ecommerce_app/features/customer/home/data/repository/home_repository_impl.dart';
import 'package:ecommerce_app/features/customer/home/domain/repository/home_repository.dart';
import 'package:ecommerce_app/features/customer/home/domain/usecases/get_latest_products_usecase.dart';
import 'package:ecommerce_app/features/customer/home/presentation/bloc/latest_products_bloc.dart';
import 'package:ecommerce_app/features/customer/search/data/data_source/search_data_source.dart';
import 'package:ecommerce_app/features/customer/search/data/repository/search_repository_impl.dart';
import 'package:ecommerce_app/features/customer/search/domain/repository/search_repository.dart';
import 'package:ecommerce_app/features/customer/search/domain/usecases/search_products_usecase.dart';
import 'package:ecommerce_app/features/customer/search/presentation/bloc/search_products_bloc.dart';

part 'init_dependencies.main.dart';
