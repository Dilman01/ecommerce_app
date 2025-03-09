import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/search/domain/repository/search_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchProductsUsecase implements UseCase<List<ProductEntity>, String> {
  final SearchRepository _searchRepository;

  const SearchProductsUsecase(this._searchRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(String title) async {
    return await _searchRepository.getSearchListProducts(title);
  }
}
