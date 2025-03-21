import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/admin/admin_products/data/models/update_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/usecases/update_product_usecase.dart';

part 'update_product_event.dart';
part 'update_product_state.dart';

class UpdateProductBloc extends Bloc<UpdateProductEvent, UpdateProductState> {
  final UpdateProductUsecase _updateProductUsecase;

  UpdateProductBloc({required UpdateProductUsecase updateProductUsecase})
    : _updateProductUsecase = updateProductUsecase,
      super(UpdateProductInitial()) {
    on<UpdateProduct>(_onUpdateProduct);
  }

  Future<void> _onUpdateProduct(
    UpdateProduct event,
    Emitter<UpdateProductState> emit,
  ) async {
    emit(UpdateProductLoading());

    final response = await _updateProductUsecase(event.body);

    response.fold(
      (l) => emit(UpdateProductFailure(l.message)),
      (r) => emit(UpdateProductSuccess()),
    );
  }
}
