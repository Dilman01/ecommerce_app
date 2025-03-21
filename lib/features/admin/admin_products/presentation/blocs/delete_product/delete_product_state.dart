part of 'delete_product_bloc.dart';

sealed class DeleteProductState extends Equatable {
  const DeleteProductState();

  @override
  List<Object> get props => [];
}

final class DeleteProductInitial extends DeleteProductState {}

final class DeleteProductLoading extends DeleteProductState {
  final int id;

  const DeleteProductLoading(this.id);

  @override
  List<Object> get props => [id];
}

final class DeleteProductSuccess extends DeleteProductState {
  final int id;

  const DeleteProductSuccess(this.id);

  @override
  List<Object> get props => [id];
}

final class DeleteProductFailure extends DeleteProductState {
  final String message;
  final int id;

  const DeleteProductFailure(this.message, this.id);

  @override
  List<Object> get props => [message, id];
}
