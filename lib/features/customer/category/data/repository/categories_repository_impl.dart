import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/category/data/data_source/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/customer/category/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/customer/category/domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepositoryImpl(this._categoriesRemoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await _categoriesRemoteDataSource.getCategories();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
