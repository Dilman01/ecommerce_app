part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddToCart extends CartEvent {
  final ProductEntity product;

  const AddToCart(this.product);

  @override
  List<Object> get props => [product];
}

final class RemoveFromCart extends CartEvent {
  final int id;

  const RemoveFromCart(this.id);

  @override
  List<Object> get props => [id];
}
