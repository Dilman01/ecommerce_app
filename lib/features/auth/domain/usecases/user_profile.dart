import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';

class UserProfile implements UseCase<UserEntity, String> {
  final AuthRepository _authRepository;

  const UserProfile(this._authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(String token) async {
    return await _authRepository.userProfile(token);
  }
}
