import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/update_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/repository/admin_products_repository.dart';

class UpdateProductUsecase implements UseCase<void, UpdateProductReqBody> {
  final AdminProductsRepository _adminProductsRepository;

  UpdateProductUsecase(this._adminProductsRepository);

  @override
  Future<Either<Failure, void>> call(UpdateProductReqBody body) async {
    return await _adminProductsRepository.updateProduct(body);
  }
}
