part of 'delete_user_bloc.dart';

sealed class DeleteUserEvent extends Equatable {
  const DeleteUserEvent();

  @override
  List<Object> get props => [];
}

final class DeleteUser extends DeleteUserEvent {
  final int userId;

  const DeleteUser(this.userId);

  @override
  List<Object> get props => [userId];
}
