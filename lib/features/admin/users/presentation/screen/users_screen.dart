import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';
import 'package:ecommerce_app/features/admin/users/presentation/widgets/search_users.dart';
import 'package:ecommerce_app/features/admin/users/presentation/widgets/users_table.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        spacing: 20.h,
        children: [
          SearchUsers(),
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllUsersBloc>().add(
                  FetchAllUsersEvent(isLoading: true),
                );
              },
              color: context.appColors.cyan,
              backgroundColor: context.appColors.backgroundColor,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                      builder: (context, state) {
                        if (state is GetAllUsersLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: context.appColors.cyan,
                            ),
                          );
                        }
                        if (state is GetAllUsersSearch) {
                          if (state.users.isEmpty) {
                            return Center(
                              child: Text(
                                'There are no users!',
                                style: context.appTextTheme.body1Medium,
                              ),
                            );
                          }
                          return UsersTable(userList: state.users);
                        }

                        if (state is GetAllUsersSuccess) {
                          if (state.users.isEmpty) {
                            return Center(
                              child: Text(
                                'There are no users!',
                                style: context.appTextTheme.body1Medium,
                              ),
                            );
                          }
                          return UsersTable(userList: state.users);
                        }

                        if (state is GetAllUsersFailure) {
                          return Center(
                            child: Text(
                              'Some error occurred, please try again later!',
                              style: context.appTextTheme.body1Medium,
                            ),
                          );
                        }

                        return SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
