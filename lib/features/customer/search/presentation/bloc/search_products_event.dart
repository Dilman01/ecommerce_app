part of 'search_products_bloc.dart';

sealed class SearchProductsEvent extends Equatable {
  const SearchProductsEvent();

  @override
  List<Object> get props => [];
}

final class SearchProductByTitle extends SearchProductsEvent {
  final String title;
  final int? priceMin;
  final int? priceMax;

  const SearchProductByTitle({
    required this.title,
    this.priceMin,
    this.priceMax,
  });

  @override
  List<Object> get props => [title];
}
