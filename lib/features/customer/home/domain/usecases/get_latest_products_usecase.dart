import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/customer/home/domain/repository/home_repository.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';

class GetLatestProductsUsecase
    implements UseCase<List<ProductEntity>, NoParams> {
  final HomeRepository _homeRepository;

  const GetLatestProductsUsecase(this._homeRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await _homeRepository.getLatestProducts();
  }
}
