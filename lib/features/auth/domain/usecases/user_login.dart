import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/login_response.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<LoginResponse, LoginReqParams> {
  final AuthRepository _authRepository;

  const UserLogin(this._authRepository);

  @override
  Future<Either<Failure, LoginResponse>> call(LoginReqParams loginReq) async {
    return await _authRepository.loginUser(loginReq);
  }
}
