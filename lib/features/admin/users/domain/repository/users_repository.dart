import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/admin/users/domain/entity/users_entity.dart';

abstract interface class UsersRepository {
  Future<Either<Failure, List<UsersEntity>>> getAllUsers();
  Future<Either<Failure, void>> deleteUser(String userId);
}
