// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infograinapp/utility/color.dart';

import '../../Widget/Commantext.dart';
import '../../Widget/listViewModelTile.dart';
import '../../utility/sharedpref.dart';
import 'bloc/all_order_bloc.dart';

class AllorderList extends StatefulWidget {
  AllorderList({super.key});

  @override
  State<AllorderList> createState() => _AllorderListState();
}

class _AllorderListState extends State<AllorderList> {
  AllOrderBloc allProductsBloc = AllOrderBloc();
  @override
  void initState() {
    allProductsBloc.add(GetInitialAllOrderListEvent());
    super.initState();
  }

  DateTime? _lastPressedAt;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<bool> _onWillPop() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) >
            const Duration(seconds: 2)) {
      // Show snackbar
      _lastPressedAt = DateTime.now();

      var snackBar = SnackBar(
        content: Text('Press again to exit'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return false; // Don't exit the app
    }
    return true; // Exit the app
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<AllOrderBloc>(
      create: (context) => allProductsBloc,
      child: BlocConsumer<AllOrderBloc, AllOrderState>(
        listener: (context, state) {
          if (state is LogoutState) {
            SharedPref.clearSharedPreference(context);
          }
        },
        builder: (context, state) {
          // ignore: deprecated_member_use
          return WillPopScope(
            onWillPop: _onWillPop,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Container(
                    margin: const EdgeInsets.all(10),
                    padding: EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        color: TextBlack,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Icon(Icons.person),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () async {
                        allProductsBloc.add(LogoutEvent());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Buy'),
                      Tab(text: 'Sell'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    BuyListView(),
                    SellListView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BuyListView extends StatelessWidget {
  final List<String> buyItems = List<String>.generate(20, (i) => "Buy Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buyItems.length,
      itemBuilder: (context, index) {
        return CustomListTile(context, null, () {});
      },
    );
  }
}

class SellListView extends StatelessWidget {
  final List<String> sellItems =
      List<String>.generate(20, (i) => "Sell Item $i");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sellItems.length,
      itemBuilder: (context, index) {
        return CustomListTile(context, null, () {});
      },
    );
  }
}
