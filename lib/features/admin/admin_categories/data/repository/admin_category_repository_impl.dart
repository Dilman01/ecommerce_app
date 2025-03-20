import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/data_source/admin_categories_data_source.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/create_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/update_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/repository/admin_category_repository.dart';

class AdminCategoryRepositoryImpl implements AdminCategoryRepository {
  final AdminCategoriesDataSource _adminCategoriesDataSource;

  AdminCategoryRepositoryImpl(this._adminCategoriesDataSource);

  @override
  Future<Either<Failure, List<AdminCategoryEntity>>> getCategories() async {
    try {
      final response = await _adminCategoriesDataSource.getCategories();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, AdminCategoryEntity>> createCategory(
    CreateCategoryReqBody body,
  ) async {
    try {
      final response = await _adminCategoriesDataSource.createCategory(body);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(int id) async {
    try {
      final response = await _adminCategoriesDataSource.deleteCategory(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(
    UpdateCategoryReqBody category,
  ) async {
    try {
      final response = await _adminCategoriesDataSource.updateCategory(
        category,
      );

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
