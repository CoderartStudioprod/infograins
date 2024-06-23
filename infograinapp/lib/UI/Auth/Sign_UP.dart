import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infograinapp/Widget/Commantext.dart';
import 'package:infograinapp/utility/color.dart';
import 'package:infograinapp/utility/utility.dart';

import '../../Widget/CommanTextField.dart';
import '../../utility/backpress.dart';
import '../../utility/validator.dart';
import 'bloc/login_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _FnameController = TextEditingController();
  final TextEditingController _LNameController = TextEditingController();
  var country = [
    "India",
    "Americs",
  ];
  final _formKey = GlobalKey<FormState>();
  String email = "", pass = "";
  LoginBloc loginBloc = LoginBloc();

  var _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<LoginBloc>(
      create: (context) => loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            BackPress.onBackPress(context);
          }
          if (state is SignUpFailureState) {
            Utility.showToast(msg: "Sign Up failure");
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
                    textwidget("SIGN UP", 34, TextBlack, FontWeight.bold),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.42,
                          child: CommonTextFormField(
                            hintText: "First Name",
                            labelText: "First Name",
                            onChanged: (v) {},
                            suffix: null,
                            readOnly: false,
                            onTap: () {},
                            controller: _FnameController,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.42,
                          child: CommonTextFormField(
                            hintText: "Last Name",
                            labelText: "Last Name",
                            onChanged: (v) {},
                            suffix: null,
                            readOnly: false,
                            onTap: () {},
                            controller: _LNameController,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20.0),
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
                      hintText: "Phone Number",
                      labelText: "Phone Namber",
                      onChanged: (v) {},
                      suffix: null,
                      readOnly: false,
                      onTap: () {},
                      controller: _mobileController,
                    ),
                    const SizedBox(height: 20.0),
                    CommonTextFormField(
                      hintText: "Enter Password",
                      labelText: "",
                      onChanged: (v) {},
                      suffix: null,
                      readOnly: false,
                      onTap: () {},
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 20.0),
                    CommonTextFormField(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      onChanged: (v) {},
                      suffix: null,
                      readOnly: false,
                      onTap: () {},
                      controller: _cpasswordController,
                    ),
                    const SizedBox(height: 20.0),
                    FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: commandecoration("Country"),
                          isEmpty: _currentSelectedValue == '',
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _currentSelectedValue,
                              isDense: true,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _currentSelectedValue = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: country.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_currentSelectedValue != null) {
                              EasyLoading.show();
                              loginBloc.add(OnSubmitSignUPEvent(
                                fname: _FnameController.text,
                                lname: _LNameController.text,
                                countrycode: country
                                        .indexOf(_currentSelectedValue ?? 0) +
                                    1,
                                email: _emailController.text,
                                pass: _passwordController.text,
                                mobile: _mobileController.text,
                              ));
                            } else {
                              Utility.showToast(msg: "Please select country!");
                            }

                            // loginBloc.add(OnSubmitEvent(
                            //     id: _emailController.text,
                            //     pass: _passwordController.text));
                          }
                        },
                        color: BTNPrimaryColor,
                        child: const Text('SIGN UP'),
                      ),
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
