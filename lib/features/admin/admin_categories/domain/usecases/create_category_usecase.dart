import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/create_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/repository/admin_category_repository.dart';

class CreateCategoryUsecase
    implements UseCase<AdminCategoryEntity, CreateCategoryReqBody> {
  final AdminCategoryRepository _adminCategoryRepository;

  CreateCategoryUsecase(this._adminCategoryRepository);

  @override
  Future<Either<Failure, AdminCategoryEntity>> call(
    CreateCategoryReqBody body,
  ) async {
    return await _adminCategoryRepository.createCategory(body);
  }
}
