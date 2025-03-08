import 'package:ecommerce_app/core/common/app/theme_cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';

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

part 'init_dependencies.main.dart';
