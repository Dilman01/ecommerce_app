import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/admin/users/data/data_source/users_data_source.dart';
import 'package:ecommerce_app/features/admin/users/domain/entity/users_entity.dart';
import 'package:ecommerce_app/features/admin/users/domain/repository/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDataSource _usersDataSource;

  UsersRepositoryImpl(this._usersDataSource);

  @override
  Future<Either<Failure, List<UsersEntity>>> getAllUsers() async {
    try {
      final response = await _usersDataSource.getAllUsers();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser(int userId) async {
    try {
      final response = await _usersDataSource.deleteUser(userId);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
