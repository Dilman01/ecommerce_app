import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/repository/admin_products_repository.dart';

class DeleteProductUsecase implements UseCase<void, int> {
  final AdminProductsRepository _adminProductsRepository;

  DeleteProductUsecase(this._adminProductsRepository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return await _adminProductsRepository.deleteProduct(id);
  }
}
