import 'package:json_annotation/json_annotation.dart';

part 'login_req_params.g.dart';

@JsonSerializable()
class LoginReqParams {
  LoginReqParams({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginReqParamsToJson(this);
}
