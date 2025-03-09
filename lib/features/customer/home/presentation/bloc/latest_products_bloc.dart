import 'dart:async';

import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/customer/home/domain/usecases/get_latest_products_usecase.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'latest_products_event.dart';
part 'latest_products_state.dart';

class LatestProductsBloc
    extends Bloc<LatestProductsEvent, LatestProductsState> {
  final GetLatestProductsUsecase _getLatestProductsUsecase;

  LatestProductsBloc({
    required GetLatestProductsUsecase getLatestProductsUsecase,
  }) : _getLatestProductsUsecase = getLatestProductsUsecase,
       super(LatestProductsInitial()) {
    on<GetLatestProducts>(_onGetLatestProducts);
  }

  FutureOr<void> _onGetLatestProducts(
    GetLatestProducts event,
    Emitter<LatestProductsState> emit,
  ) async {
    emit(LatestProductsLoading());

    final result = await _getLatestProductsUsecase(NoParams());

    result.fold(
      (failure) => emit(LatestProductsFailure(failure.message)),
      (products) => emit(LatestProductsLoaded(products)),
    );
  }
}
