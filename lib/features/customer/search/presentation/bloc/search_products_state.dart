part of 'search_products_bloc.dart';

sealed class SearchProductsState extends Equatable {
  const SearchProductsState();

  @override
  List<Object> get props => [];
}

final class SearchProductsInitial extends SearchProductsState {}

final class SearchProductsLoading extends SearchProductsState {}

final class SearchProductsSuccess extends SearchProductsState {
  final List<ProductEntity> products;

  const SearchProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}

final class SearchProductsFailure extends SearchProductsState {
  final String message;
  const SearchProductsFailure(this.message);

  @override
  List<Object> get props => [message];
}
