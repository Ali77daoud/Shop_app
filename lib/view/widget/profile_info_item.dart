import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget profileInfoItem(
  {
    required String label,
    required String info,
  }
){
  return Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: main2Color,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
              style: const TextStyle(
                  color: greyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),

              Text(info,
              style: const TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        ),
      );
}