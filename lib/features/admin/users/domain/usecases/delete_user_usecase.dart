import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/users/domain/repository/users_repository.dart';

class DeleteUserUsecase implements UseCase<void, int> {
  final UsersRepository _usersRepository;

  const DeleteUserUsecase(this._usersRepository);
  @override
  Future<Either<Failure, void>> call(int userId) async {
    return await _usersRepository.deleteUser(userId);
  }
}
