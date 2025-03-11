import 'package:ecommerce_app/features/customer/search/data/model/search_request_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/search/domain/usecases/search_products_usecase.dart';

part 'search_products_event.dart';
part 'search_products_state.dart';

class SearchProductsBloc
    extends Bloc<SearchProductsEvent, SearchProductsState> {
  final SearchProductsUsecase _searchProductsUsecase;

  String searchTitle = '';
  int? priceMin;
  int? priceMax;

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

    searchTitle = event.title;
    priceMin = event.priceMin == 0 ? 1 : event.priceMin;
    priceMax = event.priceMax;

    final response = await _searchProductsUsecase(
      SearchRequestModel(
        title: searchTitle,
        priceMin: priceMin,
        priceMax: priceMax,
      ),
    );

    response.fold(
      (l) => emit(SearchProductsFailure(l.message)),
      (r) => emit(SearchProductsSuccess(r)),
    );
  }
}
