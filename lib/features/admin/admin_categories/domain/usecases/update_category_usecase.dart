import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/update_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/repository/admin_category_repository.dart';

class UpdateCategoryUsecase implements UseCase<void, UpdateCategoryReqBody> {
  final AdminCategoryRepository _adminCategoryRepository;

  const UpdateCategoryUsecase(this._adminCategoryRepository);
  @override
  Future<Either<Failure, void>> call(UpdateCategoryReqBody category) async {
    return await _adminCategoryRepository.updateCategory(category);
  }
}
