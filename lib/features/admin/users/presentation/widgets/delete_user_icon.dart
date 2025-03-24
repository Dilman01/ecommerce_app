import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ecommerce_app/core/common/toast/show_toast.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/core/style/images/app_images.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/delete_user/delete_user_bloc.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';

class DeleteUserIcon extends StatelessWidget {
  const DeleteUserIcon({required this.userId, super.key});

  final int userId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserBloc, DeleteUserState>(
      listener: (context, state) {
        if (state is DeleteUserSuccess) {
          context.read<GetAllUsersBloc>().add(
            FetchAllUsersEvent(isLoading: false),
          );
          ShowToast.showToastSuccessTop(message: 'User has been deleted');
        }
        if (state is DeleteUserFailure) {
          ShowToast.showToastErrorTop(message: state.message);
        }
      },
      builder: (context, state) {
        if (state is DeleteUserLoading) {
          if (state.userId == userId) {
            return SizedBox(
              height: 30.h,
              width: 30.w,
              child: Center(
                child: CircularProgressIndicator(color: context.appColors.cyan),
              ),
            );
          } else {
            return SvgPicture.asset(
              AppImages.deleteIcon,
              height: 20.h,
              width: 20.w,
            );
          }
        }

        return GestureDetector(
          onTap: () {
            context.read<DeleteUserBloc>().add(DeleteUser(userId));
          },
          child: SvgPicture.asset(
            AppImages.deleteIcon,
            height: 20.h,
            width: 20.w,
          ),
        );
      },
    );
  }
}
