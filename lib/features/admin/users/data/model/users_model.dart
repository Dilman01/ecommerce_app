import 'package:json_annotation/json_annotation.dart';

import 'package:ecommerce_app/features/admin/users/domain/entity/users_entity.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel extends UsersEntity {
  UsersModel({
    required super.id,
    required super.name,
    required super.email,
    required super.avatar,
    required super.role,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}
