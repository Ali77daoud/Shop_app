import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget OptionItem(
  {
    required String text,
    required IconData icon,
    required var onTap
  }
){
  return Row(
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 33,
            height: 33,
            decoration: BoxDecoration(
              color: orangeColor,
              borderRadius: BorderRadius.circular(5),
            )
          ),
          Icon(
            icon,
            size: 20,
            color: mainColor,
            )
        ],
      )
      ,
      const SizedBox(width: 10,),
      Text(text,
          style: const TextStyle(
              color: blackColor,
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),
        ),
      const Spacer(),
      IconButton(
        onPressed: onTap,
        icon: const Icon(Icons.arrow_forward_ios),
        )
    ],
  );
}