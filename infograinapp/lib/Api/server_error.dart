// ignore_for_file: deprecated_member_use, constant_pattern_never_matches_value_type

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infograinapp/utility/Initilizier.dart';
import '../UI/Auth/Login_Page.dart';
import '../utility/color.dart';
import '../utility/sharedpref.dart';

class ServerError implements Exception {
  int? _errorCode = 200;
  String _errorMessage = "";

  ServerError.withError({required DioError? error}) {
    _handleError(error!);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) async {
    _errorCode = error.response!.statusCode!;

    switch (error.type) {
      case DioErrorType.cancel:
        _errorMessage = "request_was_cancelled_key";
        break;
      case DioErrorType.connectionTimeout:
        _errorMessage = "connection_timeout_key";
        break;
      case DioErrorType.cancel:
        _errorMessage = "connection_failed_due_to_internet_connection_key";
        break;
      case DioErrorType.receiveTimeout:
        _errorMessage = "Receive timeout in connection";
        break;
      case DioErrorType.badResponse:
        if (error.response!.statusCode == 401) {
          print("come here-->");
          _errorMessage = "";
          logout();
        }
        if (error.response!.statusCode == 404) {
          print("come here-->");
          Fluttertoast.showToast(
              msg: "Request not found. Please try again after some time.",
              backgroundColor: ColorPrimary);
        }
        if (error.response!.statusCode == 202) {
          print("come here-->");

          Fluttertoast.showToast(
              msg:
                  "Network congestion error. Please check your internet connection.",
              backgroundColor: ColorPrimary);
        }
        if (error.response!.statusCode == 429) {
          print("come here-->");

          Fluttertoast.showToast(
              msg:
                  "Network congestion error.. Please try again after some time.",
              backgroundColor: ColorPrimary);
        }
        if (error.response!.statusCode == 500) {
          print("come here-->");
          Fluttertoast.showToast(
              msg: "Something went wrong. Please try again after some time.",
              backgroundColor: ColorPrimary);
        }
        if (error.response!.statusCode == 502) {
          print("come here-->");
          Fluttertoast.showToast(
              msg:
                  "Network congestion error.. Please try again after some time.",
              backgroundColor: ColorPrimary);
        }
        if (error.response!.statusCode == 503) {
          print("come here-->");
          Fluttertoast.showToast(
              msg:
                  "The server is currently unavailable. Please try again after some time.",
              backgroundColor: ColorPrimary);
        }
        if (error.response!.statusCode == 504) {
          print("come here-->");
          Fluttertoast.showToast(
              msg: "Gateway timeout. Please try again after some time.",
              backgroundColor: ColorPrimary);
        }
        break;
      case DioErrorType.sendTimeout:
        _errorMessage = "Receive timeout in send request";
        break;
      case DioExceptionType.badCertificate:
      // TODO: Handle this case.
      case DioExceptionType.connectionError:
      // TODO: Handle this case.
      case DioExceptionType.unknown:
      // TODO: Handle this case.
    }
    return _errorMessage;
  }

  void logout() async {
    showDialog(
        barrierDismissible: false,
        context: navigationService.navigatorKey.currentContext!,
        builder: (context) => WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: AlertDialog(
                content:
                    Text("Your session has been expired! Please login again"),
                contentPadding: EdgeInsets.all(15),
                actions: [
                  TextButton(
                      onPressed: () async {
                        SharedPref.clearSharedPreference(context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                      child: Text("Ok"))
                ],
              ),
            ));

    // EasyLoading.showError("Your session has been expired! Please login again",);
  }
}
