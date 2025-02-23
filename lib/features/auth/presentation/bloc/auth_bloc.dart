import 'dart:async';

import 'package:ecommerce_app/features/auth/data/model/signup_req_params.dart';
import 'package:ecommerce_app/features/auth/domain/entities/users.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  AuthBloc({required UserSignup userSignup})
    : _userSignup = userSignup,
      super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
  }

  FutureOr<void> _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignup(event.signupReq);

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
