import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/search/data/model/search_request_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List<ProductEntity>>> getSearchListProducts(
    SearchRequestModel searchReq,
  );
}
