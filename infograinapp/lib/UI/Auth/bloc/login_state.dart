part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginVerifiedState extends LoginState {}

class SignUpSuccessState extends LoginState {}

class SignUpFailureState extends LoginState {
  final msg;
  SignUpFailureState({this.msg});
}

class VerificationFailureState extends LoginState {
  final msg;
  VerificationFailureState({this.msg});
}

class LoginFailureState extends LoginState {
  final msg;
  LoginFailureState({this.msg});
}
