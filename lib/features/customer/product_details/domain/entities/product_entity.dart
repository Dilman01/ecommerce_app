import 'package:ecommerce_app/features/customer/product_details/data/model/product_model.dart';

class ProductEntity {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final CategoryProductModel? category;
  final List<String>? images;

  ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });
}
