import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/services/network/dio_client.dart';
import 'package:ecommerce_app/features/customer/product_details/data/model/product_model.dart';

abstract interface class HomeDataSource {
  Future<List<ProductModel>> getLatestProducts();
}

class HomeDataSourceImpl implements HomeDataSource {
  final DioClient _dio;

  const HomeDataSourceImpl(this._dio);

  @override
  Future<List<ProductModel>> getLatestProducts() async {
    try {
      final response = await _dio.get(ApiConstants.products);

      final List<ProductModel> products =
          (response.data as List)
              .map((product) => ProductModel.fromJson(product))
              .toList();

      return products;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
