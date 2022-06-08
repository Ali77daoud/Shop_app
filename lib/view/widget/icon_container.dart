import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/string.dart';
import 'package:shop_app/utils/theme.dart';

Widget iconContainer(
  {
    required String image,
    required String text,
    required Color color,
    required double h,
    required bool ifNetwork,
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
          child: Container(
                width: 35,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image:ifNetwork?DecorationImage(
                    image: NetworkImage('$baseUrl/$image'),
                    fit: BoxFit.fill
                  ):
                  DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill
                  )
                ),
                ),
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