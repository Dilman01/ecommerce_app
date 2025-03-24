part of 'get_all_users_bloc.dart';

sealed class GetAllUsersEvent extends Equatable {
  const GetAllUsersEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllUsersEvent extends GetAllUsersEvent {
  final bool isLoading;

  const FetchAllUsersEvent({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class SearchUsersEvent extends GetAllUsersEvent {
  final String searchName;

  const SearchUsersEvent(this.searchName);

  @override
  List<Object> get props => [searchName];
}
