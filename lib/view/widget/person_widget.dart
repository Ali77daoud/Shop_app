import 'package:flutter/cupertino.dart';
import 'package:shop_app/utils/theme.dart';

Widget PersonWidget(
  {
    required double imgHight,
    required double imgWidth,
    required String img,
    required String name,
    required String email,
  }
){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: imgWidth,
        height: imgWidth,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover, 
            ),
        ),
      ),
      const SizedBox(width: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(name,
            style: const TextStyle(
                color: blackColor,
                fontSize: 13,
                fontWeight: FontWeight.normal
              ),
          ),
          Text(email,
            style: const TextStyle(
                color: blackColor,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
          ),
        ],
      )
    ],
  );
}