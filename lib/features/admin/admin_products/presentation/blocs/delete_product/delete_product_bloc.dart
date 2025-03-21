import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/admin/admin_products/domain/usecases/delete_product_usecase.dart';

part 'delete_product_event.dart';
part 'delete_product_state.dart';

class DeleteProductBloc extends Bloc<DeleteProductEvent, DeleteProductState> {
  final DeleteProductUsecase _deleteProductUsecase;

  DeleteProductBloc({required DeleteProductUsecase deleteProductUsecase})
    : _deleteProductUsecase = deleteProductUsecase,
      super(DeleteProductInitial()) {
    on<DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<DeleteProductState> emit,
  ) async {
    emit(DeleteProductLoading(event.id));

    final response = await _deleteProductUsecase(event.id);

    response.fold(
      (l) => emit(DeleteProductFailure(l.message, event.id)),
      (r) => emit(DeleteProductSuccess(event.id)),
    );
  }
}
