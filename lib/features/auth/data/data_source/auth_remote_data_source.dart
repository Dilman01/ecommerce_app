import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/login_response.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpUser(SignupReqParams signupReq);
  Future<LoginResponse> loginUser(LoginReqParams loginReq);
  Future<UserModel> userProfile(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> signUpUser(SignupReqParams signupReq) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.users,
        data: signupReq.toJson(),
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<LoginResponse> loginUser(LoginReqParams loginReq) async {
    try {
      final response = await _dioClient.post(
        ApiConstants.login,
        data: loginReq.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } catch (e) {
      Logger().e(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> userProfile(String token) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.profile,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      Logger().e(e.toString());

      throw ServerException(e.toString());
    }
  }
}
