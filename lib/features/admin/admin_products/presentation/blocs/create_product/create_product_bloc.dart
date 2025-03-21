import 'package:ecommerce_app/features/admin/admin_products/data/models/create_product_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_products/domain/usecases/create_product_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  final CreateProductUsecase _createProductUsecase;

  CreateProductBloc({required CreateProductUsecase createProductUsecase})
    : _createProductUsecase = createProductUsecase,
      super(CreateProductInitial()) {
    on<CreateProduct>(_onCreateProduct);
  }

  Future<void> _onCreateProduct(
    CreateProduct event,
    Emitter<CreateProductState> emit,
  ) async {
    emit(CreateProductLoading());

    final response = await _createProductUsecase(event.body);

    response.fold(
      (l) => emit(CreateProductFailure(l.message)),
      (r) => emit(CreateProductSuccess()),
    );
  }
}
