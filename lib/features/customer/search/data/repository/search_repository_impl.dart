import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/search/data/data_source/search_data_source.dart';
import 'package:ecommerce_app/features/customer/search/data/model/search_request_model.dart';
import 'package:ecommerce_app/features/customer/search/domain/repository/search_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource _searchDataSource;

  const SearchRepositoryImpl(this._searchDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getSearchListProducts(
    SearchRequestModel searchReq,
  ) async {
    try {
      final response = await _searchDataSource.getSearchListProducts(searchReq);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
