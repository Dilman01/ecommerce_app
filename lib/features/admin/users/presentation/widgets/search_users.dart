import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecommerce_app/core/extensions/context_extensions.dart';
import 'package:ecommerce_app/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';

class SearchUsers extends StatefulWidget {
  const SearchUsers({super.key});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          cursorColor: context.appColors.arrowColor,
          onChanged: (value) {
            context.read<GetAllUsersBloc>().add(SearchUsersEvent(value));
          },
          decoration: InputDecoration(
            hintText: 'Search For Users',
            hintStyle: context.appTextTheme.captionRegular.copyWith(
              color: context.appColors.grey150,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: context.appColors.grey50),
              borderRadius: BorderRadius.circular(12).r,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.appColors.grey50),
              borderRadius: BorderRadius.circular(12).r,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.appColors.grey50),
              borderRadius: BorderRadius.circular(12).r,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
                context.read<GetAllUsersBloc>().add(
                  const FetchAllUsersEvent(isLoading: true),
                );
              },
              icon:
                  controller.text.isEmpty
                      ? const SizedBox.shrink()
                      : Icon(Icons.clear, color: context.appColors.arrowColor),
            ),
          ),
          textCapitalization: TextCapitalization.words,
          style: context.appTextTheme.captionRegular,
        );
      },
    );
  }
}
