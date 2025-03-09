import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List<ProductEntity>>> getSearchListProducts(
    String title,
  );
}
