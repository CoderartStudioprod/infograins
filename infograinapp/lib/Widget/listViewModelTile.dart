import 'dart:math';

import 'package:flutter/material.dart';

import '../utility/color.dart';
import 'Commantext.dart';

Widget CustomListTile(context, data, onPressed) {
  return GestureDetector(
    onTap: () => onPressed(data["_id"], images[Random().nextInt(3)]),
    child: Container(
      // color: Colors.red ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              images[Random().nextInt(3)],
              height: 140,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.45,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          textwidget(
              data["name"] ?? "undefined", 18, TextBlack, FontWeight.bold),
          textwidget(data['description'] ?? "undefined", 13, TextBlackLight,
              FontWeight.w400),
          textwidget("\u{20B9} " + data['price'].toString(), 15, TextBlack,
              FontWeight.w600),
        ],
      ),
    ),
  );
}

List<String> images = [
  "https://img.freepik.com/free-psd/full-screen-smartphone-mockup-design_53876-65968.jpg?w=1380&t=st=1702933999~exp=1702934599~hmac=de8231f2d231c90a0700439fd0ec5e4c36ad466d5cdff849c714bd07bef0f76b",
  "https://img.freepik.com/free-psd/premium-mobile-phone-screen-mockup-template_53876-65749.jpg?w=1800&t=st=1702934083~exp=1702934683~hmac=92f52dc1b6b3b32ce3f7fa4b3c74a15d4e426b343fafba653e93b0989e369550",
  "https://img.freepik.com/free-psd/black-smartphone-mock-up_1310-217.jpg?w=2000&t=st=1702934138~exp=1702934738~hmac=b78b878083d583518c36102fc179aa651224cd6bf10ff45bd90c32c1f1d1f045",
  "https://img.freepik.com/free-psd/new-collection-sneakers-social-media-template_505751-3249.jpg?w=1380&t=st=1702934255~exp=1702934855~hmac=5a10bca68ad4e0e462039b08f13063291bd2bff1e3df2ab5b8c7b72b3d6235d0"
];
