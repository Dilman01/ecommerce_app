import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/customer/category/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/customer/category/domain/repository/categories_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetAllCategoriesUsecase
    implements UseCase<List<CategoryEntity>, NoParams> {
  final CategoriesRepository _categoriesRepo;

  GetAllCategoriesUsecase(this._categoriesRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await _categoriesRepo.getCategories();
  }
}
