import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/login_response.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signUpUser(
    SignupReqParams signupReq,
  ) async {
    try {
      final user = await _remoteDataSource.signUpUser(signupReq);

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> loginUser(
    LoginReqParams loginReq,
  ) async {
    try {
      final response = await _remoteDataSource.loginUser(loginReq);

      return right(response);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> userProfile(String token) async {
    try {
      final user = await _remoteDataSource.userProfile(token);

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
