import 'package:json_annotation/json_annotation.dart';

part 'create_product_req_body.g.dart';

@JsonSerializable()
class CreateProductReqBody {
  CreateProductReqBody({
    required this.title,
    required this.imageList,
    required this.categoryId,
    required this.description,
    required this.price,
  });

  final String title;
  final double price;
  final List<String> imageList;
  final String description;
  final double categoryId;

  Map<String, dynamic> toJson() => _$CreateProductReqBodyToJson(this);
}
