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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<AllOrderBloc>(
      create: (context) => allProductsBloc,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                await SharedPref.clearSharedPreference(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login_page", (route) => false);
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
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textwidget("Welcome Back,", 28, TextBlack, FontWeight.bold),
                    textwidget(
                        "Jahid Khan", 18, TextBlackLight, FontWeight.w500),
                    const SizedBox(height: 20),
                    textwidget(
                        "Top Products", 35, ColorPrimary, FontWeight.w500),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              BlocBuilder<AllOrderBloc, AllOrderState>(
                  bloc: allProductsBloc,
                  builder: (context, state) {
                    if (state is GetAllorder) {
                      return Expanded(
                        child: state.list!.length < 1
                            ? Center(
                                child: Column(
                                  children: [
                                    Image.network(
                                      "https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg",
                                      width: size.width * 0.7,
                                      height: 150,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    textwidget("No Data Found", 20, TextBlack,
                                        FontWeight.w600),
                                  ],
                                ),
                              )
                            : GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1 / 1.23),
                                itemCount: state.list!.length,
                                itemBuilder: (ctx, i) {
                                  return CustomListTile(context, state.list![i],
                                      (id, image) {
                                    // allProductsBloc.add(GetDetailProductIDEvent(
                                    //     id: id, image: image));
                                  });
                                }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
