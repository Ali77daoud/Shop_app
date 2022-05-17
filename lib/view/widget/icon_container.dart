import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget iconContainer(
  {
    required Widget icon,
    required String text,
    required Color color,
    required double h,
  }
) {
  return Column(
    children: [
      Container(
        width: 45,
        height: 50,
        decoration: BoxDecoration(
          color: lightGreyColor1,
          borderRadius: BorderRadius.circular(10),
          boxShadow:  [
                BoxShadow(
              color: lightGreyColor2,
              offset: const Offset(
                0,
                0,
              ),
              blurRadius: 1.0,
              spreadRadius: 1.0,
            )
            ]
          ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: icon,
        ),
      ),
      SizedBox(height: h,),
      Text(text,
        maxLines: 2,
        style: TextStyle(
            color: color,
            fontSize: 13,
            fontWeight: FontWeight.bold
          ),
      )
    ],
  );
}