part of 'search_products_bloc.dart';

sealed class SearchProductsEvent extends Equatable {
  const SearchProductsEvent();

  @override
  List<Object> get props => [];
}

final class SearchProductByTitle extends SearchProductsEvent {
  final String title;

  const SearchProductByTitle(this.title);

  @override
  List<Object> get props => [title];
}
