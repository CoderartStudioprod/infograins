import 'dart:math';

import 'package:flutter/material.dart';

import '../utility/color.dart';
import 'Commantext.dart';

Widget CustomListTile(context, data, onPressed) {
  return GestureDetector(
      onTap: () => onPressed(data["_id"]),
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blueGrey.shade500,
                child: Text("SL",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sliceledger",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "20-Feb-2022, 08:05 AM",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    "Qty: 500000",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Price: 36100",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Total: 36100",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}
