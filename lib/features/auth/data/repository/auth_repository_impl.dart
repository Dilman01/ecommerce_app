import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/users.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UsersEntity>> signUpUser(
    SignupReqParams signupReq,
  ) async {
    try {
      final user = await _remoteDataSource.signUpUser(signupReq);

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
