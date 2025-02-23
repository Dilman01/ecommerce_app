import 'package:ecommerce_app/features/auth/domain/entities/users.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UsersEntity {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
