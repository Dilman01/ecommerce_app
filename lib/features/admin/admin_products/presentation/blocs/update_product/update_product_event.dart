part of 'update_product_bloc.dart';

sealed class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();

  @override
  List<Object> get props => [];
}

final class UpdateProduct extends UpdateProductEvent {
  final UpdateProductReqBody body;

  const UpdateProduct(this.body);

  @override
  List<Object> get props => [body];
}
