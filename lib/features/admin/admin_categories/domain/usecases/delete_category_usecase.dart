import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/repository/admin_category_repository.dart';

class DeleteCategoryUsecase implements UseCase<void, int> {
  final AdminCategoryRepository _adminCategoryRepository;

  DeleteCategoryUsecase(this._adminCategoryRepository);
  @override
  Future<Either<Failure, void>> call(int id) async {
    return await _adminCategoryRepository.deleteCategory(id);
  }
}
