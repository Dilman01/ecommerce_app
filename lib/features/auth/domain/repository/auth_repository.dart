import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/login_response.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signUpUser(SignupReqParams signupReq);
  Future<Either<Failure, LoginResponse>> loginUser(LoginReqParams loginReq);
  Future<Either<Failure, UserEntity>> userProfile(String token);
  Future<Either<Failure, void>> logout();
}
