import 'package:json_annotation/json_annotation.dart';

part 'update_category_req_body.g.dart';

@JsonSerializable()
class UpdateCategoryReqBody {
  final int? id;
  final String? name;
  final String? image;

  UpdateCategoryReqBody({
    required this.id,
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$UpdateCategoryReqBodyToJson(this);
}
