import 'package:ecommerce_app/features/customer/category/domain/usecases/get_products_by_category_usecase.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_products_by_category_event.dart';
part 'get_products_by_category_state.dart';

class GetProductsByCategoryBloc
    extends Bloc<GetProductsByCategoryEvent, GetProductsByCategoryState> {
  final GetProductsByCategoryUsecase _getProductsByCategoryUsecase;

  GetProductsByCategoryBloc({
    required GetProductsByCategoryUsecase getProductsByCategoryUsecase,
  }) : _getProductsByCategoryUsecase = getProductsByCategoryUsecase,
       super(GetProductsByCategoryInitial()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategory event,
    Emitter<GetProductsByCategoryState> emit,
  ) async {
    emit(GetProductsByCategoryLoading());
    final result = await _getProductsByCategoryUsecase(event.id);
    result.fold(
      (failure) => emit(GetProductsByCategoryFailure(failure.message)),
      (products) => emit(ProductsByCategoryLoaded(products)),
    );
  }
}
