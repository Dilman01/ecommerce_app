part of 'create_product_bloc.dart';

sealed class CreateProductEvent extends Equatable {
  const CreateProductEvent();

  @override
  List<Object> get props => [];
}

final class CreateProduct extends CreateProductEvent {
  final CreateProductReqBody body;

  const CreateProduct(this.body);

  @override
  List<Object> get props => [body];
}
