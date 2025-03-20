import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/admin/admin_categories/data/model/create_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/usecases/create_category_usecase.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final CreateCategoryUsecase _createCategoryUsecase;

  CreateCategoryBloc({required CreateCategoryUsecase createCategoryUsecase})
    : _createCategoryUsecase = createCategoryUsecase,
      super(CreateCategoryInitial()) {
    on<CreateCategory>(_onCreateCategory);
  }

  Future<void> _onCreateCategory(
    CreateCategory event,
    Emitter<CreateCategoryState> emit,
  ) async {
    emit(CreateCategoryLoading());
    final response = await _createCategoryUsecase(event.body);

    response.fold(
      (l) => emit(CreateCategoryFailure(l.message)),
      (r) => emit(CreateCategorySuccess()),
    );
  }
}
