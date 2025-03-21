import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/create_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/update_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/entity/admin_product_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AdminProductsRepository {
  Future<Either<Failure, List<AdminProductEntity>>> getAllProducts();
  Future<Either<Failure, void>> createProduct(CreateProductReqBody body);
  Future<Either<Failure, void>> updateProduct(UpdateProductReqBody body);
  Future<Either<Failure, void>> deleteProduct(int id);
}
