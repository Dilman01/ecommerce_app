import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/repository/admin_category_repository.dart';

class GetAllAdminCategoriesUsecase
    implements UseCase<List<AdminCategoryEntity>, NoParams> {
  final AdminCategoryRepository _adminCategoryRepository;

  GetAllAdminCategoriesUsecase(this._adminCategoryRepository);

  @override
  Future<Either<Failure, List<AdminCategoryEntity>>> call(
    NoParams params,
  ) async {
    return await _adminCategoryRepository.getCategories();
  }
}
