

import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget circleDialog(
  {
    required Color circleColor,
    required Color backgroundColor,
    required String text,
  }
){
  return
   WillPopScope(
    onWillPop: () async => false,
    child: SimpleDialog(
      backgroundColor: backgroundColor,

      children: [
        Center(
          child:
            Column(
              children: [
                CircularProgressIndicator(
                  color: circleColor,
                ),
                const SizedBox(height: 20,),
                Text(
                  text,
                  style:const TextStyle(
                    color: mainColor,
                  ),
                )
              ],
            )
         ),
      ],
    ),
    );
}