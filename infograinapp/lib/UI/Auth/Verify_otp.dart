import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infograinapp/UI/Auth/bloc/login_bloc.dart';
import 'package:infograinapp/Widget/Commantext.dart';
import 'package:infograinapp/utility/backpress.dart';
import 'package:infograinapp/utility/color.dart';
import 'package:infograinapp/utility/sharedpref.dart';
import 'package:infograinapp/utility/utility.dart';
import 'package:infograinapp/utility/validator.dart';

class VerifyOTPSCREEN extends StatefulWidget {
  final email;
  const VerifyOTPSCREEN({super.key, required this.email});

  @override
  State<VerifyOTPSCREEN> createState() => _VerifyOTPSCREENState();
}

// SharedPref.setBooleanPreference(SharedPref.LOGIN, true);
class _VerifyOTPSCREENState extends State<VerifyOTPSCREEN> {
  LoginBloc loginBloc = LoginBloc();
  TextEditingController _otpController = TextEditingController();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                BackPress.onBackPress(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorBlack,
              )),
          backgroundColor: Colors.white,
          title: textwidget("Verification", 20, ColorBlack, FontWeight.w600)),
      body: BlocProvider<LoginBloc>(
        create: (context) => loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is VerificationFailureState) {
              Utility.showToast(msg: state.msg);
            }
            if (state is LoginVerifiedState) {
              SharedPref.setBooleanPreference(SharedPref.LOGIN, true);
              Navigator.pushReplacementNamed(context, "/All_Order_list");
            }
          },
          child: Container(
            // padding: const EdgeInsets.all(30),
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // textHeader(),

                    textwidget("Enter the OTP Sent to Your Email", 14,
                        BTNPrimaryColor, FontWeight.normal),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _otpController,
                      obscureText: passwordVisible,
                      validator: (pas) => Validator.oTPValidator(pas!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 18, 10, 10)),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: RedDarkColor,
                            width: 1.2,
                          ),
                        ),
                        errorStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 182, 182)),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Color(0xff1B263B),
                            width: 1.2,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 10),
                        hintStyle: TextStyle(color: subtestcolor),
                        hintText: 'Enter OTP',
                      ),
                      textAlign: TextAlign.start,
                    ),

                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.security_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        textwidget("Never share your OTP/Code with anyone else",
                            10, BTNPrimaryColor, FontWeight.normal),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_otpController.text.isNotEmpty) {
                            loginBloc.add(VerifyOtp(
                                otp: _otpController.text, email: widget.email));
                          }
                          // if (_formKey.currentState!.validate()) {
                          //   EasyLoading.show();
                          //   loginBloc.add(OnSubmitEvent(
                          //       id: _emailController.text,
                          //       pass: _passwordController.text));
                          // }
                        },
                        color: BTNPrimaryColor,
                        child: const Text('SUBMIT'),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    const SizedBox(height: 30.0),
                    // CreateAccountButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
