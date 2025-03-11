import 'package:json_annotation/json_annotation.dart';

part 'search_request_model.g.dart';

@JsonSerializable()
class SearchRequestModel {
  final String title;
  @JsonKey(name: 'price_min')
  final int? priceMin;
  @JsonKey(name: 'price_max')
  final int? priceMax;

  SearchRequestModel({
    required this.title,
    required this.priceMin,
    required this.priceMax,
  });

  Map<String, dynamic> toJson() => _$SearchRequestModelToJson(this);
}
