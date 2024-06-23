import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infograinapp/UI/Auth/Verify_otp.dart';
import 'package:infograinapp/Widget/CommanTextField.dart';
import 'package:infograinapp/utility/dcryptfun.dart';

import '../../Widget/Commantext.dart';
import '../../utility/color.dart';
import '../../utility/sharedpref.dart';
import '../../utility/utility.dart';
import '../../utility/validator.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email = "", pass = "";
  LoginBloc loginBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.pushNamed(context, "/verify_otp",
                arguments: VerifyOTPSCREEN(email: _emailController.text));
          }
          if (state is LoginFailureState) {
            Utility.showToast(
              msg: state.msg,
            );
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // textHeader(),
                    textwidget("Login", 34, TextBlack, FontWeight.bold),
                    const SizedBox(height: 30.0),
                    CommonTextFormField(
                      hintText: "Email",
                      labelText: "Email",
                      onChanged: (v) {},
                      suffix: null,
                      readOnly: false,
                      onTap: () {},
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20.0),
                    CommonTextFormField(
                      hintText: "Password",
                      labelText: "Password",
                      onChanged: (v) {},
                      suffix: null,
                      readOnly: false,
                      onTap: () {},
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            EasyLoading.show();
                            loginBloc.add(OnSubmitEvent(
                                id: _emailController.text,
                                pass: _passwordController.text));
                          }
                        },
                        color: BTNPrimaryColor,
                        child: const Text('LOGIN'),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // decryptResponse(
                            //     "u9Gu4u8lBqOROlIgVE5T2/FFHkOOpWvKzeOuPAU/fudFbeuvH45OzRRo4uxMHzuClkq0YMIEZ7kK4C70EUBHWqMpQUcd75y+KxaUgAXNU7s+Rssze1rPRLSTrox4I67pXimsbbfR/MnmhMutUQ48Xl2/9A8IiWi0LTUZNZvCNCCeqzs0Efm53LPzi7h2+ub6MxcyYKN530C/SZwbI6922kFy+VjCJiB0iE8WnA/WHqV9hCLHfCML2keFxAlvpq+bXBteTdmfgdReTE6fb9n/LOVVlHaaxROezriQpfP9FjCk8QlIUzvRmr8VUcgnshLiU85etqNr/gCS/qFKGNp9olK60lUDJX8sDPHwcabzFeoJE49c2b21eRViuR/0ZJoHZkn9EGYfapHtExHhQSeB6M+I0b2fOpoTf1INmGVrDnjffraQn/50V/3pcKdt67EXcS/6DTbX/DNbLfJLztU8TUrQ9+83ZiB/g38U4QCGU0D3svbl+0DchCw79SK57GMYdSrUX9wJNuLQvQqQAn0LUel7TpTjOWsM6YOe8V3O12baoAlmS66siHxZF2W+ofxpH9II2drepm/CLKrO7LnNj9jJ2vfqGJcMZ667fE8r+dueOuG69c5hm2Wa3k6r1Bbe");

                            Navigator.pushNamed(context, "/sign_up",
                                arguments: null);
                          },
                          child: textwidget(
                              "SIGN UP", 14, ColorTextPrimary, FontWeight.w600),
                        ),
                        textwidget("FORGET YOUR PASSWARD?", 14, subtestcolor,
                            FontWeight.w600),
                      ],
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
