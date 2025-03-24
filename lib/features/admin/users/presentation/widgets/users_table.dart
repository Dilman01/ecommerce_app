import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/users/domain/entity/users_entity.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/delete_user/delete_user_bloc.dart';
import 'package:ecommerce_app/features/admin/users/presentation/widgets/delete_user_icon.dart';
import 'package:ecommerce_app/features/admin/users/presentation/widgets/table_cell_title.dart';

class UsersTable extends StatelessWidget {
  const UsersTable({required this.userList, super.key});

  final List<UsersEntity> userList;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: context.appColors.grey50),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(90.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: context.appColors.cyan50),
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitle(icon: Icons.person_outlined, title: 'Name'),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitle(icon: Icons.email_outlined, title: 'Email'),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitle(
                icon: Icons.delete_outline,
                title: 'Delete',
              ),
            ),
          ],
        ),
        ...List.generate(
          userList.length,
          (index) => TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(10).r,
                  child: Text(
                    userList[index].name ?? 'Unknown',
                    style: context.appTextTheme.captionSemiBold,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.all(10).r,
                  child: Text(
                    userList[index].email ?? 'Unknown',
                    style: context.appTextTheme.captionSemiBold,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: BlocProvider(
                  create: (context) => sl<DeleteUserBloc>(),
                  child: DeleteUserIcon(userId: userList[index].id ?? -1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
