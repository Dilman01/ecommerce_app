part of 'latest_products_bloc.dart';

sealed class LatestProductsState extends Equatable {
  const LatestProductsState();

  @override
  List<Object> get props => [];
}

final class LatestProductsInitial extends LatestProductsState {}

final class LatestProductsLoading extends LatestProductsState {}

final class LatestProductsLoaded extends LatestProductsState {
  final List<ProductEntity> products;

  const LatestProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

final class LatestProductsFailure extends LatestProductsState {
  final String message;

  const LatestProductsFailure(this.message);

  @override
  List<Object> get props => [message];
}
