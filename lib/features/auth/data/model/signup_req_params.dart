import 'package:json_annotation/json_annotation.dart';

part 'signup_req_params.g.dart';

@JsonSerializable()
class SignupReqParams {
  const SignupReqParams({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.avatar,
  });

  final String name;
  final String email;
  final String password;
  final String role;
  final String avatar;

  Map<String, dynamic> toJson() => _$SignupReqParamsToJson(this);
}
