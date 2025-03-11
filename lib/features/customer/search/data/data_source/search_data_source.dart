import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/customer/product_details/data/model/product_model.dart';
import 'package:ecommerce_app/features/customer/search/data/model/search_request_model.dart';

abstract interface class SearchDataSource {
  Future<List<ProductModel>> getSearchListProducts(
    SearchRequestModel searchReq,
  );
}

class SearchDataSourceImpl implements SearchDataSource {
  final DioClient _dio;

  const SearchDataSourceImpl(this._dio);

  @override
  Future<List<ProductModel>> getSearchListProducts(
    SearchRequestModel searchReq,
  ) async {
    try {
      final response = await _dio.get(
        ApiConstants.products,
        queryParameters: searchReq.toJson(),
      );

      return (response.data as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
