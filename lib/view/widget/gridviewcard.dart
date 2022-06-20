import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/string.dart';
import 'package:shop_app/utils/theme.dart';

Widget homeCard(
  {
    required double hight,
    required double width,
    required double widthBetweenPrice,
    required double elevation,
    required Color color,
    required double radius,
    required String centertext,
    required String img,
    required String price1,
    required String price2,
    bool ifNetworkImage = false,
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
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0,right: 0,),
              child: ifNetworkImage?
              Container(
                width: width,
                height: hight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: FancyShimmerImage(
                    imageUrl:'$baseUrl/$img' ,
                    boxFit: BoxFit.cover,
                    shimmerBaseColor: lightGreyColor1,  
                    shimmerHighlightColor: mainColor,  
                    shimmerBackColor: whiteColor,
                    errorWidget: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: greyColor,
                        ),
                      child: const Center(child: Text('error in loading',style: TextStyle(fontSize: 10),)),
                    ),
                    ),
                ),
              ):
              Container(
                width: width,
                height: hight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(radius),topRight: Radius.circular(radius)),
                  image:
                  DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.cover,
                  )
                ),
              )
              ,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('$price2 \$',
                    maxLines: 2,
                    style: const TextStyle(
                        color: greyColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.lineThrough,
                      ),
                  ),
                  SizedBox(width: widthBetweenPrice,),
                  Text('$price1 \$',
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.normal
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
  );
}