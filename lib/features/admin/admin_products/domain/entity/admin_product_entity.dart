import 'package:ecommerce_app/features/admin/admin_products/data/models/admin_product_model.dart';

class AdminProductEntity {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final AdminCategoryProductModel? category;
  final List<String>? images;

  AdminProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });
}
