import 'package:flutter/material.dart';
import 'package:shop_app/utils/string.dart';
import 'package:shop_app/utils/theme.dart';

Widget drawerItems(
  {
    required var ontap,
    required String title,
    required String image,
  }
){
  return InkWell(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                width: 35,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('$baseUrl/$image'),
                    fit: BoxFit.fill
                  )
                )  ,
                ),
              const SizedBox(width: 20,),
              Text(title,
                style : const TextStyle(
                color: whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
              )
            ],
          ),
        );
}