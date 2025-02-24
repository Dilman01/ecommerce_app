part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  final SignupReqParams signupReq;

  const AuthSignUp(this.signupReq);

  @override
  List<Object> get props => [signupReq];
}

final class AuthLogin extends AuthEvent {
  final LoginReqParams loginReq;

  const AuthLogin(this.loginReq);

  @override
  List<Object> get props => [loginReq];
}
