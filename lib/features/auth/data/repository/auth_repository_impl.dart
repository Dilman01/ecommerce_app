import 'package:ecommerce_app/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/login_response.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  const AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, UserEntity>> signUpUser(
    SignupReqParams signupReq,
  ) async {
    try {
      final user = await _remoteDataSource.signUpUser(signupReq);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> loginUser(
    LoginReqParams loginReq,
  ) async {
    try {
      final response = await _remoteDataSource.loginUser(loginReq);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> userProfile(String token) async {
    try {
      final user = await _remoteDataSource.userProfile(token);

      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _localDataSource.logout();

      return right(null);
    } catch (e) {
      return left(Failure('Failed to logout'));
    }
  }
}
