part of 'delete_product_bloc.dart';

sealed class DeleteProductEvent extends Equatable {
  const DeleteProductEvent();

  @override
  List<Object> get props => [];
}

final class DeleteProduct extends DeleteProductEvent {
  final int id;

  const DeleteProduct(this.id);

  @override
  List<Object> get props => [id];
}
