part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnSubmitEvent extends LoginEvent {
  final id;
  final pass;
  const OnSubmitEvent({this.id, this.pass});

  @override
  List<Object> get props => [id, pass];
}

class VerifyOtp extends LoginEvent {
  final email;
  final otp;

  const VerifyOtp({this.email, this.otp});

  @override
  List<Object> get props => [otp];
}

class OnSubmitSignUPEvent extends LoginEvent {
  final fname;
  final lname;
  final email;
  final pass;
  final countrycode;
  final mobile;
  const OnSubmitSignUPEvent(
      {this.fname,
      this.lname,
      this.countrycode,
      this.email,
      this.mobile,
      this.pass});

  @override
  List<Object> get props => [fname, lname, mobile, email, pass, countrycode];
}
