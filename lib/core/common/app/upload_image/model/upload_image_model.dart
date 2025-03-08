import 'package:json_annotation/json_annotation.dart';

part 'upload_image_model.g.dart';

@JsonSerializable()
class UploadImageModel {
  UploadImageModel({this.location});

  final String? location;

  factory UploadImageModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImageModelFromJson(json);
}
