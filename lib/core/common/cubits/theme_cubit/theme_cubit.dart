import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/core/services/shared_pref/pref_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(ThemeMode.system)) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    bool isDark = SharedPref().getBool(PrefKeys.themeMode) ?? false;

    emit(ThemeChange(isDark ? ThemeMode.dark : ThemeMode.light));
  }

  Future<void> toggleTheme() async {
    final newTheme = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    emit(ThemeChange(newTheme));

    await SharedPref().setBool(PrefKeys.themeMode, newTheme == ThemeMode.dark);
  }
}
