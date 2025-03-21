import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/data_source/admin_products_data_source.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/create_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/update_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/entity/admin_product_entity.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/repository/admin_products_repository.dart';

class AdminProductsRepositoryImpl implements AdminProductsRepository {
  final AdminProductsDataSource _adminProductsDataSource;

  AdminProductsRepositoryImpl(this._adminProductsDataSource);

  @override
  Future<Either<Failure, List<AdminProductEntity>>> getAllProducts() async {
    try {
      final response = await _adminProductsDataSource.getAllProducts();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(CreateProductReqBody body) async {
    try {
      final response = await _adminProductsDataSource.createProduct(body);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(UpdateProductReqBody body) async {
    try {
      final response = await _adminProductsDataSource.updateProduct(body);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {
      final response = await _adminProductsDataSource.deleteProduct(id);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
