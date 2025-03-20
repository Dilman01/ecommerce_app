import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/admin_category_model.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/create_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/data/model/update_category_req_body.dart';

abstract interface class AdminCategoriesDataSource {
  Future<List<AdminCategoryModel>> getCategories();
  Future<AdminCategoryModel> createCategory(CreateCategoryReqBody body);
  Future<void> updateCategory(UpdateCategoryReqBody category);
  Future<void> deleteCategory(int id);
}

class AdminCategoriesDataSourceImpl implements AdminCategoriesDataSource {
  final DioClient _dio;

  AdminCategoriesDataSourceImpl(this._dio);

  @override
  Future<AdminCategoryModel> createCategory(CreateCategoryReqBody body) async {
    try {
      final response = await _dio.post(
        ApiConstants.categories,
        data: body.toJson(),
      );

      return AdminCategoryModel.fromJson(response.data);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteCategory(int id) async {
    try {
      await _dio.delete('${ApiConstants.categories}/$id');
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<AdminCategoryModel>> getCategories() async {
    try {
      final response = await _dio.get(ApiConstants.categories);

      return (response.data as List)
          .map((e) => AdminCategoryModel.fromJson(e))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> updateCategory(UpdateCategoryReqBody category) async {
    try {
      await _dio.put(
        '${ApiConstants.categories}/${category.id}',
        data: category.toJson(),
      );
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
