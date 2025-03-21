part of 'get_all_admin_products_bloc.dart';

sealed class GetAllAdminProductsState extends Equatable {
  const GetAllAdminProductsState();

  @override
  List<Object> get props => [];
}

final class GetAllAdminProductsInitial extends GetAllAdminProductsState {}

final class GetAllAdminProductsLoading extends GetAllAdminProductsState {}

final class GetAllAdminProductsSuccess extends GetAllAdminProductsState {
  final List<AdminProductEntity> products;

  const GetAllAdminProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}

final class GetAllAdminProductsFailure extends GetAllAdminProductsState {
  final String message;

  const GetAllAdminProductsFailure(this.message);

  @override
  List<Object> get props => [message];
}
