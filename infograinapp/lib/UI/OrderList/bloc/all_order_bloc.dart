import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infograinapp/Api/NavigationService.dart';
import 'package:infograinapp/utility/sharedpref.dart';
import '../../../utility/Initilizier.dart';
import '../../../utility/network.dart';
import '../../../utility/utility.dart';

part 'all_order_event.dart';
part 'all_order_state.dart';

class AllOrderBloc extends Bloc<AllorderEvent, AllOrderState> {
  AllOrderBloc() : super(AllProductsInitial());
  @override
  Stream<AllOrderState> mapEventToState(AllorderEvent event) async* {
    if (event is GetInitialAllOrderListEvent) {
      debugPrint("hoye!!!");
      yield* allorder();
    }
    if (event is LogoutEvent) {
      yield* logout();
    }
  }

  Stream<AllOrderState> allorder() async* {
    if (await Network.isConnected()) {
      // yield LoadingState(message: "");

      final response = await apiProvider.getOrderList();
      log(response.toString());
      EasyLoading.dismiss();
      // yield GetAllorder(list: response.isEmpty ? [] : response);
    } else {
      EasyLoading.dismiss();
      Utility.showToast(
        msg: "Please Check Your Internet Connection",
      );
    }
  }

  Stream<AllOrderState> logout() async* {
    if (await Network.isConnected()) {
      // yield LoadingState(message: "");
      SharedPref.clearSharedPreference(
          navigationService.navigatorKey.currentContext!);
      final response = await apiProvider.logoutusers();
      log(response.toString());
      EasyLoading.dismiss();
      if (response.success) {
        yield LogoutState();
      }
      // yield GetAllorder(list: response.isEmpty ? [] : response);
    } else {
      EasyLoading.dismiss();
      Utility.showToast(
        msg: "Please Check Your Internet Connection",
      );
    }
  }
}
