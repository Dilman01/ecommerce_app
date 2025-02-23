import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/users.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UsersEntity>> signUpUser(SignupReqParams signupReq);
}
