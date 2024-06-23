import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Api/Endpoint.dart';
import '../Api/NavigationService.dart';
import '../Api/api_provider.dart';
import 'color.dart';

NavigationService navigationService = NavigationService();
BaseOptions baseOptions = BaseOptions(
    baseUrl: EndPoints.BASE_URL,
    receiveTimeout: const Duration(milliseconds: 60000),
    sendTimeout: const Duration(milliseconds: 60000),
    responseType: ResponseType.json,
    maxRedirects: 3,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });
Dio dio = Dio(baseOptions);
ApiProvider apiProvider = ApiProvider();

class Init {
  configEasyLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..backgroundColor = Colors.transparent
      ..progressColor = ColorPrimary
      ..backgroundColor = ColorPrimary
      ..indicatorColor = ColorPrimary
      ..textColor = ColorPrimary
      ..maskColor = ColorPrimary
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  ThemeData themeData(context) => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.transparent,
      iconTheme: const IconThemeData(
        color: ColorPrimary,
        opacity: 1,
      ),
      unselectedWidgetColor: Colors.black,
      primaryColor: ColorPrimary,
      primaryColorDark: ColorPrimary,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        buttonColor: ColorPrimary,
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          hoverColor: ColorPrimary,
          hintStyle: TextStyle(
            color: Color.fromRGBO(85, 85, 85, 1.0),
            fontSize: 13,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            fontSize: 13,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          errorStyle: TextStyle(color: Colors.red, fontSize: 15)),
      appBarTheme: const AppBarTheme(
        elevation: 1,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorPrimary,
        ),
        backgroundColor: ColorPrimary,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
        ColorPrimary.value,
        <int, Color>{
          50: Color(0xFFFFFFFF),
          100: Color(0xFFD4D1FD),
          200: Color(0xFFABA2F6),
          300: Color(0xFF887BFC),
          400: Color(0xFF796AFF),
          500: Color(ColorPrimary.value),
          600: Color(0xFF5344F8),
          700: Color(0xFF4530FC),
          800: Color(0xFF2C17FF),
          900: Color(0xFF1500F5),
        },
      )).copyWith(secondary: ColorPrimary).copyWith(secondary: ColorPrimary));
}
