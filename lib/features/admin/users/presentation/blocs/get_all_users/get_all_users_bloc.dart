import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/admin/users/domain/entity/users_entity.dart';
import 'package:ecommerce_app/features/admin/users/domain/usecases/get_all_users_usecase.dart';

part 'get_all_users_event.dart';
part 'get_all_users_state.dart';

class GetAllUsersBloc extends Bloc<GetAllUsersEvent, GetAllUsersState> {
  final GetAllUsersUsecase _getAllUsersUsecase;

  List<UsersEntity> usersList = [];

  GetAllUsersBloc({required GetAllUsersUsecase getAllUsersUsecase})
    : _getAllUsersUsecase = getAllUsersUsecase,
      super(GetAllUsersInitial()) {
    on<FetchAllUsersEvent>(_onFetchAllUsersEvent);
    on<SearchUsersEvent>(_onSearchUsersEvent);
  }

  Future<void> _onFetchAllUsersEvent(
    FetchAllUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    if (event.isLoading) {
      emit(GetAllUsersLoading());
    }

    final response = await _getAllUsersUsecase(NoParams());

    response.fold((l) => emit(GetAllUsersFailure(l.message)), (users) {
      usersList = users;
      emit(GetAllUsersSuccess(users));
    });
  }

  Future<void> _onSearchUsersEvent(
    SearchUsersEvent event,
    Emitter<GetAllUsersState> emit,
  ) async {
    final searchResult =
        usersList
            .where(
              (e) =>
                  e.name!.toLowerCase().startsWith(
                    event.searchName.toLowerCase().trim(),
                  ) ||
                  e.email!.toLowerCase().startsWith(
                    event.searchName.toLowerCase().trim(),
                  ),
            )
            .toList();

    emit(GetAllUsersSuccess(searchResult));
  }
}
