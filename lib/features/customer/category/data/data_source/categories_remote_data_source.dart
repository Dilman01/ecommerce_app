import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/customer/category/data/model/category_model.dart';
import 'package:ecommerce_app/features/customer/product_details/data/model/product_model.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProductsByCategory(int id);
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final DioClient _dio;

  CategoriesRemoteDataSourceImpl(this._dio);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await _dio.get(ApiConstants.categories);

      return (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int id) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.categories}/$id/products',
      );

      return (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
