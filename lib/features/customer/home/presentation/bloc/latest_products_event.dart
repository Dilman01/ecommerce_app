part of 'latest_products_bloc.dart';

sealed class LatestProductsEvent extends Equatable {
  const LatestProductsEvent();

  @override
  List<Object> get props => [];
}

final class GetLatestProducts extends LatestProductsEvent {}
