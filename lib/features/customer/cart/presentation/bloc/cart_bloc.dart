import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial([])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    emit(CartLoading(state.products));

    await Future.delayed(const Duration(seconds: 1));

    if (state.products.contains(event.product)) {
      emit(CartError('Product is Already Added to Cart', state.products));
    } else {
      emit(CartSuccess([event.product, ...state.products]));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final products =
        state.products.where((product) => product.id != event.id).toList();

    emit(CartSuccess(products));
  }
}
