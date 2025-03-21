part of 'update_product_bloc.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();

  @override
  List<Object> get props => [];
}

final class UpdateProductInitial extends UpdateProductState {}

final class UpdateProductLoading extends UpdateProductState {}

final class UpdateProductSuccess extends UpdateProductState {}

final class UpdateProductFailure extends UpdateProductState {
  final String message;

  const UpdateProductFailure(this.message);

  @override
  List<Object> get props => [message];
}
