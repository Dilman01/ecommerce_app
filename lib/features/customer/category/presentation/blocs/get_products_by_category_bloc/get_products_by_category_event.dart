part of 'get_products_by_category_bloc.dart';

sealed class GetProductsByCategoryEvent extends Equatable {
  const GetProductsByCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductsByCategory extends GetProductsByCategoryEvent {
  final int id;

  const GetProductsByCategory(this.id);

  @override
  List<Object> get props => [id];
}
