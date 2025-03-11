part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState(this.products);

  final List<ProductEntity> products;

  @override
  List<Object> get props => [products];
}

final class CartInitial extends CartState {
  const CartInitial(super.products);
}

final class CartLoading extends CartState {
  const CartLoading(super.products);
}

final class CartSuccess extends CartState {
  const CartSuccess(super.products);
}

final class CartError extends CartState {
  final String message;

  const CartError(this.message, super.products);

  @override
  List<Object> get props => [message];
}
