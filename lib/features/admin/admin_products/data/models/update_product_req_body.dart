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
  @JsonKey(name: 'images')
  final List<String> imageList;
  final String description;
  final int categoryId;
  final int productId;

  Map<String, dynamic> toJson() => _$UpdateProductReqBodyToJson(this);
}
