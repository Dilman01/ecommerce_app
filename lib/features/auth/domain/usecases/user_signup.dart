import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class UserSignup implements UseCase<UserEntity, SignupReqParams> {
  final AuthRepository _authRepository;

  const UserSignup(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(SignupReqParams signupReq) async {
    return await _authRepository.signUpUser(signupReq);
  }
}
