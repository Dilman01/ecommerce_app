import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/entity/admin_product_entity.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/repository/admin_products_repository.dart';

class GetAllAdminProductsUsecase
    implements UseCase<List<AdminProductEntity>, NoParams> {
  final AdminProductsRepository _adminProductsRepository;

  GetAllAdminProductsUsecase(this._adminProductsRepository);

  @override
  Future<Either<Failure, List<AdminProductEntity>>> call(
    NoParams params,
  ) async {
    return await _adminProductsRepository.getAllProducts();
  }
}
