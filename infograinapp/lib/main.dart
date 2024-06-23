import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infograinapp/UI/Auth/Sign_UP.dart';
import 'package:infograinapp/UI/Auth/Verify_otp.dart';
import 'package:infograinapp/utility/Initilizier.dart';
import 'package:infograinapp/utility/routs.dart';
import 'package:page_transition/page_transition.dart';
import 'UI/Auth/Login_Page.dart';
import 'UI/OrderList/All_Order_List.dart';
import 'UI/SplashScreen/Splash_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Init().configEasyLoading();
  dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestHeader: false,
      requestBody: true,
      request: true,
      error: true,
      logPrint: (t) {
        log(t.toString());
      }));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // Init init = Init();
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Color(0xff493ad6));
    return MaterialApp(
      title: 'Quickly',
      theme: Init().themeData(context),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey,
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: child,
        );
      },
      onGenerateRoute: (route) {
        switch (route.name) {
          case "/":
            return PageTransition(
                type: PageTransitionType.fade, child: const SplashScreen());

          case Routes.SPLASH_SCREEN:
            return PageTransition(
                type: PageTransitionType.fade, child: const SplashScreen());

          case Routes.LOGIN_PAGE:
            return PageTransition(
                type: PageTransitionType.fade, child: const LoginPage());
          case Routes.SIGN_UP_PAGE:
            return PageTransition(
                type: PageTransitionType.fade, child: const SignUp());
          case Routes.VERIFY_OTP:
            VerifyOTPSCREEN args = route.arguments as VerifyOTPSCREEN;
            return PageTransition(
                type: PageTransitionType.fade,
                child: VerifyOTPSCREEN(email: args.email));

          case Routes.ALL_Order_LIST:
            return PageTransition(
                type: PageTransitionType.fade, child: AllorderList());
        }
        //   return null;
      },
      home: const SplashScreen(),
    );
  }
}
