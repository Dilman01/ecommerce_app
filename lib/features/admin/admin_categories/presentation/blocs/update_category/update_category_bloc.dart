import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/features/admin/admin_categories/data/model/update_category_req_body.dart';
import 'package:ecommerce_app/features/admin/admin_categories/domain/usecases/update_category_usecase.dart';

part 'update_category_event.dart';
part 'update_category_state.dart';

class UpdateCategoryBloc
    extends Bloc<UpdateCategoryEvent, UpdateCategoryState> {
  final UpdateCategoryUsecase _updateCategoryUsecase;

  UpdateCategoryBloc({required UpdateCategoryUsecase updateCategoryUsecase})
    : _updateCategoryUsecase = updateCategoryUsecase,
      super(UpdateCategoryInitial()) {
    on<UpdateCategory>(_onUpdateCategory);
  }

  Future<void> _onUpdateCategory(
    UpdateCategory event,
    Emitter<UpdateCategoryState> emit,
  ) async {
    emit(UpdateCategoryLoading());

    final response = await _updateCategoryUsecase(event.body);

    response.fold(
      (l) => emit(UpdateCategoryFailure(l.message)),
      (r) => emit(UpdateCategorySuccess()),
    );
  }
}
