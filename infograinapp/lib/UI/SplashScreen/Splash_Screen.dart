import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infograinapp/UI/OrderList/All_Order_List.dart';
import 'package:infograinapp/UI/OrderList/bloc/all_order_bloc.dart';

import '../../utility/network.dart';
import '../../utility/sharedpref.dart';
import '../../utility/utility.dart';
import '../Auth/Login_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> validApp() async {
    if (await Network.isConnected()) {
      getLogin();
    } else {
      Utility.showToast(msg: "Please check Your Internet connection");
    }
  }

  void getLogin() async {
    if (await SharedPref.getBooleanPreference(SharedPref.LOGIN)) {
// ignore: unrelated_type_equality_checks
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => AllorderList())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage())));
    }
  }

  @override
  void initState() {
    super.initState();
    validApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(0),
        //   child: AppBar(
        //     elevation: 0,
        //   ),
        // ),
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Slice Ledger")
          ],
        ),
      ),
    )));
  }
}
