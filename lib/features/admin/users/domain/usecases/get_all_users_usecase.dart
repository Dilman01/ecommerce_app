import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/users/domain/entity/users_entity.dart';
import 'package:ecommerce_app/features/admin/users/domain/repository/users_repository.dart';

class GetAllUsersUsecase implements UseCase<List<UsersEntity>, NoParams> {
  final UsersRepository _usersRepository;

  const GetAllUsersUsecase(this._usersRepository);

  @override
  Future<Either<Failure, List<UsersEntity>>> call(NoParams params) async {
    return await _usersRepository.getAllUsers();
  }
}
