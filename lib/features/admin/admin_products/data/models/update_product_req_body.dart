import 'package:json_annotation/json_annotation.dart';

part 'update_product_req_body.g.dart';

@JsonSerializable()
class UpdateProductReqBody {
  UpdateProductReqBody({
    required this.categoryId,
    required this.description,
    required this.imageList,
    required this.price,
    required this.productId,
    required this.title,
  });

  final String title;
  final double price;
  final List<String> imageList;
  final String description;
  final double categoryId;
  final String productId;

  Map<String, dynamic> toJson() => _$UpdateProductReqBodyToJson(this);
}
