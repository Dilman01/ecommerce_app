import 'package:ecommerce_app/features/admin/users/domain/usecases/delete_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final DeleteUserUsecase _deleteUserUsecase;

  DeleteUserBloc({required DeleteUserUsecase deleteUserUsecase})
    : _deleteUserUsecase = deleteUserUsecase,
      super(DeleteUserInitial()) {
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onDeleteUser(
    DeleteUser event,
    Emitter<DeleteUserState> emit,
  ) async {
    emit(DeleteUserLoading(event.userId));

    final response = await _deleteUserUsecase(event.userId);

    response.fold(
      (l) => emit(DeleteUserFailure(l.message)),
      (r) => emit(DeleteUserSuccess()),
    );
  }
}
