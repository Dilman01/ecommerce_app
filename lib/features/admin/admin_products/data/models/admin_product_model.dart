import 'package:ecommerce_app/features/admin/admin_products/domain/entity/admin_product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_product_model.g.dart';

@JsonSerializable()
class AdminProductModel extends AdminProductEntity {
  AdminProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.images,
  });

  factory AdminProductModel.fromJson(Map<String, dynamic> json) =>
      _$AdminProductModelFromJson(json);
}

@JsonSerializable()
class AdminCategoryProductModel {
  final int? id;
  final String? name;
  AdminCategoryProductModel({required this.id, required this.name});

  factory AdminCategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$AdminCategoryProductModelFromJson(json);
}
