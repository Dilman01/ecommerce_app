import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<ProductEntity>>> getLatestProducts();
}
