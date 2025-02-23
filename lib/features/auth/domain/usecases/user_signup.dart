import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/users.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class UserSignup implements UseCase<UsersEntity, SignupReqParams> {
  final AuthRepository _authRepository;

  const UserSignup(this._authRepository);

  @override
  Future<Either<Failure, UsersEntity>> call(SignupReqParams signupReq) async {
    return await _authRepository.signUpUser(signupReq);
  }
}
