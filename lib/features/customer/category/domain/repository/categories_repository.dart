import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/category/domain/entities/category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
