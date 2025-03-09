import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/customer/home/data/data_source/home_data_source.dart';
import 'package:ecommerce_app/features/customer/home/domain/repository/home_repository.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:fpdart/fpdart.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  const HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getLatestProducts() async {
    try {
      final response = await _homeDataSource.getLatestProducts();

      return right(response);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
