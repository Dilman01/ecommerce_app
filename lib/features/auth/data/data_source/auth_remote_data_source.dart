import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpUser(SignupReqParams signupReq);
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
}
