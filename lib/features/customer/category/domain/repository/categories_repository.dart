import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/category/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CategoriesRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(int id);
}
