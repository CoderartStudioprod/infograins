// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infograinapp/Api/Endpoint.dart';
import 'package:infograinapp/Api/server_error.dart';
import 'package:infograinapp/model/SigupResponse.dart';
import 'package:infograinapp/model/VerifyOTPRes.dart';
import 'package:infograinapp/utility/dcryptfun.dart';
import 'package:infograinapp/utility/sharedpref.dart';
import '../model/AllProductList.dart';
import '../model/LoginResponse.dart';
import '../utility/Initilizier.dart';

class ApiProvider {
  static ApiProvider apiProvider = ApiProvider.internal();

  ApiProvider.internal();

  factory ApiProvider() {
    return apiProvider;
  }
  Init init = Init();
  Future<SignUpresponse> userSignUp(input) async {
    try {
      Response res = await dio.post(
        "https://bharattoken.org/sliceLedger/admin/api/auth/signUp",
        data: input,
      );

      SignUpresponse response =
          SignUpresponse.fromJson(decryptResponse(res.toString()));
      return response;
    } catch (error) {
      EasyLoading.dismiss();
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
        debugPrint(message.toString());
      } else {
        message = "Something Went wrong";
        debugPrint(message.toString());
      }
      EasyLoading.dismiss();
      return SignUpresponse(success: false);
    }
  }

  Future<VerifyOtPres> verifyLoginUp(input) async {
    try {
      Response res = await dio.post(
        "https://bharattoken.org/sliceLedger/admin/api/auth/verifyOtp",
        data: input,
      );

      VerifyOtPres response =
          VerifyOtPres.fromJson(decryptResponse(res.toString()));
      return response;
    } catch (error) {
      EasyLoading.dismiss();
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
        debugPrint(message.toString());
      } else {
        message = "Something Went wrong";
        debugPrint(message.toString());
      }
      EasyLoading.dismiss();
      log("jkkkk");
      return VerifyOtPres(success: false, message: message);
    }
  }

  Future<LoginResponse> userLogin(input) async {
    try {
      Response res = await dio.post(
        "https://bharattoken.org/sliceLedger/admin/api/auth/login",
        data: input,
      );
      LoginResponse response =
          LoginResponse.fromJson(decryptResponse(res.toString()));

      return response;
    } catch (error) {
      EasyLoading.dismiss();
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
        debugPrint(message.toString());
      } else {
        message = "Something Went wrong";
        debugPrint(message.toString());
      }
      EasyLoading.dismiss();
      return LoginResponse(success: false);
    }
  }

  Future<List<Listofpriduct>> getOrderList() async {
    try {
      String accessToken = await SharedPref.getStringPreference("token");
      Response res = await dio.get(EndPoints.ALL_ORDER,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $accessToken"
          }));
      // List<Listofpriduct> response = json.decode(res.toString());
      List<dynamic> data = json.decode(decryptResponse(res.toString()));
      debugPrint("jahid==>" + data.toString());
      return data.cast<Listofpriduct>();

      // return response;Listofpriduct
    } catch (error) {
      debugPrint("jahid==>" + error.toString());
      if (error is DioError) {
      } else {}
      return [];
    }
  }

  Future<dynamic> logoutusers() async {
    try {
      String accessToken = await SharedPref.getStringPreference("token");
      Response res = await dio.get(EndPoints.LOGOUT,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $accessToken"
          }));
      // List<Listofpriduct> response = json.decode(res.toString());
      var data = json.decode(decryptResponse(res.toString()));
      debugPrint("jahid==>" + data.toString());
      return data.cast<Listofpriduct>();

      // return response;Listofpriduct
    } catch (error) {
      debugPrint("jahid==>" + error.toString());
      if (error is DioError) {
      } else {}
      return [];
    }
  }
}
