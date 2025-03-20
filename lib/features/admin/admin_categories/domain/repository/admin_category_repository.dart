import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/create_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/update_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AdminCategoryRepository {
  Future<Either<Failure, List<AdminCategoryEntity>>> getCategories();
  Future<Either<Failure, AdminCategoryEntity>> createCategory(
    CreateCategoryReqBody body,
  );
  Future<Either<Failure, void>> updateCategory(UpdateCategoryReqBody category);
  Future<Either<Failure, void>> deleteCategory(int id);
}
