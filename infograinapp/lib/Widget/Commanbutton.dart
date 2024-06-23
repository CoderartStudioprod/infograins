import 'package:flutter/material.dart';

import '../utility/color.dart';

class AppButton extends StatelessWidget {
  final onPressed;
  final title;
  final double width;
  final double height;

  AppButton({this.title, this.onPressed, this.width = 220, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        minWidth: width,
        height: height,
        padding: const EdgeInsets.all(8.0),
        textColor: Colors.white,
        color: TextBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: TextBlack,
        onPressed: onPressed,
        child: Text(
          "$title",
          style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
