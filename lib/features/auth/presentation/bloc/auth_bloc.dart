import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/core/services/secure_storage/secure_storage.dart';
import 'package:ecommerce_app/core/services/secure_storage/secure_storage_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/pref_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/core/usecase/usecase.dart';
import 'package:ecommerce_app/features/auth/data/model/login_req_params.dart';
import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_login.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_logout.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_profile.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;
  final UserProfile _userProfile;
  final UserLogout _userLogout;

  UserEntity? user;

  AuthBloc({
    required UserSignup userSignup,
    required UserLogin userLogin,
    required UserProfile userProfile,
    required UserLogout userLogout,
  }) : _userSignup = userSignup,
       _userLogin = userLogin,
       _userProfile = userProfile,
       _userLogout = userLogout,
       super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthCheck>(_onAuthCheck);
    on<AuthLogout>(_onAuthLogout);
  }

  Future<void> _onAuthCheck(AuthCheck event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final accessToken = await SecureStorage().read(
      SecureStorageKeys.accessToken,
    );
    if (accessToken != null) {
      emit(AuthLoggedIn());
      final res = await _userProfile(accessToken);

      res.fold((l) => emit(AuthFailure(l.message)), (userData) {
        user = userData;
      });
    } else {
      emit(AuthLoggedOut());
    }
  }

  Future<void> _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userSignup(event.signupReq);

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(event.loginReq);

    await res.fold((l) async => emit(AuthFailure(l.message)), (loginRes) async {
      final accessToken = loginRes.accessToken ?? '';
      final refreshToken = loginRes.refreshToken ?? '';

      await SecureStorage().write(SecureStorageKeys.accessToken, accessToken);
      await SecureStorage().write(SecureStorageKeys.refreshToken, refreshToken);

      final userRes = await _userProfile(accessToken);

      await userRes.fold((l) async => emit(AuthFailure(l.message)), (
        userData,
      ) async {
        await SharedPref().setString(PrefKeys.userRole, userData.role ?? '');

        user = userData;

        emit(AuthSuccess(userData));
      });
    });
  }

  FutureOr<void> _onAuthLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    await _userLogout(NoParams());

    emit(AuthLoggedOut());
  }
}
