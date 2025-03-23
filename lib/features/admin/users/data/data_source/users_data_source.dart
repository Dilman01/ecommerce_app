import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/admin/users/data/model/users_model.dart';

abstract interface class UsersDataSource {
  Future<List<UsersModel>> getAllUsers();
  Future<void> deleteUser(String userId);
}

class UsersDataSourceImpl implements UsersDataSource {
  final DioClient _dio;

  UsersDataSourceImpl(this._dio);

  @override
  Future<List<UsersModel>> getAllUsers() async {
    try {
      final response = await _dio.get(ApiConstants.users);

      return (response.data as List)
          .map((e) => UsersModel.fromJson(e))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    try {
      await _dio.delete('${ApiConstants.users}/$userId');
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
