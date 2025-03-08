import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/customer/category/domain/repository/categories_repository.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

class GetProductsByCategoryUsecase
    implements UseCase<List<ProductEntity>, int> {
  final CategoriesRepository _categoriesRepository;

  GetProductsByCategoryUsecase(this._categoriesRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(int id) async {
    return await _categoriesRepository.getProductsByCategory(id);
  }
}
