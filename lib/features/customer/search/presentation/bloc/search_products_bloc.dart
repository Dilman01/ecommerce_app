import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/search/domain/usecases/search_products_usecase.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  final SearchProductsUsecase _searchProductsUsecase;

  SearchProductsBloc({required SearchProductsUsecase searchProductsUsecase})
    : _searchProductsUsecase = searchProductsUsecase,
      super(SearchProductsInitial()) {
    on<SearchProductByTitle>(_onSearchProductByTitle);
  }

  Future<void> _onSearchProductByTitle(
    SearchProductByTitle event,
    Emitter<SearchProductsState> emit,
  ) async {
    emit(SearchProductsLoading());

    final response = await _searchProductsUsecase(event.title);

    response.fold(
      (l) => emit(SearchProductsFailure(l.message)),
      (r) => emit(SearchProductsSuccess(r)),
    );
  }
}
