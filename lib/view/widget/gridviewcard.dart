import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget homeCard(
  {
    required double elevation,
    required Color color,
    required double radius,
    required String centertext,
    required String img,
    required double price1,
    required double price2,
  }
){
  return Card(
    color: color,
    elevation: elevation,
    shadowColor: Colors.white,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide.none
       ),

    child: Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0,right: 0,),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(centertext,
              maxLines: 2,
              style: const TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
            ),
            const SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('$price1 \$',
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                    ),
                ),
                Text('$price2 \$',
                  maxLines: 2,
                  style: const TextStyle(
                      color: greyColor,
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
  );
}