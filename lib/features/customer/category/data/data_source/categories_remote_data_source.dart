import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/customer/category/data/model/category_model.dart';

abstract interface class CategoriesRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
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
}
