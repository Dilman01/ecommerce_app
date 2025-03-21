import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_products/data/models/create_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/repository/admin_products_repository.dart';

class CreateProductUsecase implements UseCase<void, CreateProductReqBody> {
  final AdminProductsRepository _adminProductsRepository;

  CreateProductUsecase(this._adminProductsRepository);
  @override
  Future<Either<Failure, void>> call(CreateProductReqBody body) async {
    return await _adminProductsRepository.createProduct(body);
  }
}
