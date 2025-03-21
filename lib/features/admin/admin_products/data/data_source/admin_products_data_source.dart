import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/admin_product_model.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/create_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/update_product_req_body.dart';

abstract interface class AdminProductsDataSource {
  Future<List<AdminProductModel>> getAllProducts();
  Future<void> createProduct(CreateProductReqBody body);
  Future<void> updateProduct(UpdateProductReqBody body);
  Future<void> deleteProduct(int id);
}

class AdminProductsDataSourceImpl implements AdminProductsDataSource {
  final DioClient _dio;

  const AdminProductsDataSourceImpl(this._dio);

  @override
  Future<List<AdminProductModel>> getAllProducts() async {
    try {
      final response = await _dio.get(ApiConstants.products);

      final List<AdminProductModel> products =
          (response.data as List)
              .map((product) => AdminProductModel.fromJson(product))
              .toList();

      return products;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> createProduct(CreateProductReqBody body) async {
    try {
      await _dio.post(ApiConstants.products, data: body.toJson());
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> updateProduct(UpdateProductReqBody body) async {
    try {
      await _dio.put(
        '${ApiConstants.products}/${body.productId}',
        data: body.toJson(),
      );
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await _dio.delete('${ApiConstants.products}/$id');
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
