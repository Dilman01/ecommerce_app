part of 'get_products_by_category_bloc.dart';

sealed class GetProductsByCategoryState extends Equatable {
  const GetProductsByCategoryState();

  @override
  List<Object> get props => [];
}

final class GetProductsByCategoryInitial extends GetProductsByCategoryState {}

final class GetProductsByCategoryLoading extends GetProductsByCategoryState {}

final class ProductsByCategoryLoaded extends GetProductsByCategoryState {
  final List<ProductEntity> products;
  const ProductsByCategoryLoaded(this.products);

  @override
  List<Object> get props => [products];
}

final class GetProductsByCategoryFailure extends GetProductsByCategoryState {
  final String message;
  const GetProductsByCategoryFailure(this.message);

  @override
  List<Object> get props => [message];
}
