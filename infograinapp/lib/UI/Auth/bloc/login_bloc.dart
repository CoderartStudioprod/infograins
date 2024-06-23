import 'dart:collection';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infograinapp/model/SigupResponse.dart';
import 'package:infograinapp/utility/Initilizier.dart';

import '../../../model/LoginResponse.dart';
import '../../../model/VerifyOTPRes.dart';
import '../../../utility/GetDeviceInfo.dart';
import '../../../utility/network.dart';
import '../../../utility/utility.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());
  GetDeviceInfo getDeviceInfo = GetDeviceInfo();
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnSubmitEvent) {
      yield* loginresponse(event);
    }
    if (event is OnSubmitSignUPEvent) {
      yield* signUP(event);
    }
    if (event is VerifyOtpEvent) {
      yield* virifyUser(event);
    }
  }

  Stream<LoginState> loginresponse(OnSubmitEvent event) async* {
    if (await Network.isConnected()) {
      yield LoginInitial();
      // yield LoadingState(message: "");
      Map input = HashMap();

      input["email"] = event.id;
      input["password"] = event.pass;

      // debugPrint(input.toString());
      EasyLoading.show(status: "Loading...");
      LoginResponse response = await apiProvider.userLogin(input);
      EasyLoading.dismiss();
      if (response.success) {
        Utility.showToast(
          msg: "otpsent",
        );
        yield LoginSuccessState();
      } else {
        yield LoginFailureState(msg: "Something want wrong!!");
      }
    } else {
      EasyLoading.dismiss();
      yield LoginFailureState(msg: "Please Check Your Internet Connection");
      // Utility.showToast(
      //   msg: "Please Check Your Internet Connection",
      // );
    }
  }

  Stream<LoginState> signUP(OnSubmitSignUPEvent event) async* {
    if (await Network.isConnected()) {
      yield LoginInitial();
      // yield LoadingState(message: "");
      Map input = HashMap();
      input["first_name"] = event.fname;
      input["last_name"] = event.lname;
      input["email"] = event.email;
      input["phoneNumber"] = event.mobile;
      input["password"] = event.pass;
      input["country_id"] = event.countrycode;

      // debugPrint(input.toString());
      EasyLoading.show(status: "Loading...");
      SignUpresponse response = await apiProvider.userSignUp(input);
      EasyLoading.dismiss();
      if (response.success) {
        Utility.showToast(
          msg: "Please verify OTP",
        );
        yield SignUpSuccessState();
      } else {
        yield LoginFailureState(msg: "Something want wrong!!");
      }
    } else {
      EasyLoading.dismiss();
      yield LoginFailureState(msg: "Please Check Your Internet Connection");
      // Utility.showToast(
      //   msg: "Please Check Your Internet Connection",
      // );
    }
  }

  Stream<LoginState> virifyUser(event) async* {
    log("khhkhk khk");
    VerifyOtPres? response;
    if (await Network.isConnected()) {
      log("Connected");
      EasyLoading.show(status: "Loading...");
      Map input = await getDeviceInfo.getDeviceInfo(event.email, event.otp);
      yield LoginInitial();
      log("enter khk");
      response = await apiProvider.verifyLoginUp(input);
      EasyLoading.dismiss();
      if (response.success) {
        Utility.showToast(
          msg: response.message!,
        );
        yield LoginVerifiedState();
      } else {
        log("error" + response.message!);
        Utility.showToast(msg: "442 stuts error");
        yield VerificationFailureState(msg: response.message!);
      }
    } else {
      EasyLoading.dismiss();
      yield VerificationFailureState(
          msg: "Please Check Your Internet Connection");
    }
  }
}
