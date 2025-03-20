import 'package:json_annotation/json_annotation.dart';

part 'create_category_req_body.g.dart';

@JsonSerializable()
class CreateCategoryReqBody {
  final String name;
  final String image;

  CreateCategoryReqBody({required this.name, required this.image});

  Map<String, dynamic> toJson() => _$CreateCategoryReqBodyToJson(this);
}
