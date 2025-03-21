part of 'get_all_admin_products_bloc.dart';

sealed class GetAllAdminProductsEvent extends Equatable {
  const GetAllAdminProductsEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllAdminProducts extends GetAllAdminProductsEvent {
  final bool isLoading;

  const FetchAllAdminProducts(this.isLoading);

  @override
  List<Object> get props => [isLoading];
}
