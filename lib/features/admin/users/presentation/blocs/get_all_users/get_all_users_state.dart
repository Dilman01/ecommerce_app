part of 'get_all_users_bloc.dart';

sealed class GetAllUsersState extends Equatable {
  const GetAllUsersState();

  @override
  List<Object> get props => [];
}

final class GetAllUsersInitial extends GetAllUsersState {}

final class GetAllUsersLoading extends GetAllUsersState {}

final class GetAllUsersSuccess extends GetAllUsersState {
  final List<UsersEntity> users;

  const GetAllUsersSuccess(this.users);

  @override
  List<Object> get props => [users];
}

final class GetAllUsersSearch extends GetAllUsersState {
  final List<UsersEntity> users;

  const GetAllUsersSearch(this.users);

  @override
  List<Object> get props => [users];
}

final class GetAllUsersFailure extends GetAllUsersState {
  final String message;

  const GetAllUsersFailure(this.message);

  @override
  List<Object> get props => [message];
}
