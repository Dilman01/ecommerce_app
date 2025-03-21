import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/entity/admin_product_entity.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/usecases/get_all_admin_products_usecase.dart';

part 'get_all_admin_products_event.dart';
part 'get_all_admin_products_state.dart';

class GetAllAdminProductsBloc
    extends Bloc<GetAllAdminProductsEvent, GetAllAdminProductsState> {
  final GetAllAdminProductsUsecase _getAllAdminProductsUsecase;

  GetAllAdminProductsBloc({
    required GetAllAdminProductsUsecase getAllAdminProductsUsecase,
  }) : _getAllAdminProductsUsecase = getAllAdminProductsUsecase,
       super(GetAllAdminProductsInitial()) {
    on<FetchAllAdminProducts>(_onFetchAllAdminProducts);
  }

  Future<void> _onFetchAllAdminProducts(
    FetchAllAdminProducts event,
    Emitter<GetAllAdminProductsState> emit,
  ) async {
    if (event.isLoading) {
      emit(GetAllAdminProductsLoading());
    }

    final response = await _getAllAdminProductsUsecase(NoParams());

    response.fold(
      (l) => emit(GetAllAdminProductsFailure(l.message)),
      (r) => emit(GetAllAdminProductsSuccess(r)),
    );
  }
}
