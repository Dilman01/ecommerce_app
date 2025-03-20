import 'package:ecommerce_app/features/admin/admin_categories/domain/entity/admin_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_category_model.g.dart';

@JsonSerializable()
class AdminCategoryModel extends AdminCategoryEntity {
  AdminCategoryModel({
    required super.id,
    required super.name,
    required super.image,
  });

  factory AdminCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$AdminCategoryModelFromJson(json);
}
