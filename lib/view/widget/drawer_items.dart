import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
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
                  padding: const EdgeInsets.all(4.0),
                  child: FancyShimmerImage(
                    imageUrl:'$baseUrl/$image' ,
                    boxFit: BoxFit.fill,
                    shimmerBaseColor: lightGreyColor1,  
                    shimmerHighlightColor: mainColor,  
                    shimmerBackColor: whiteColor,
                    errorWidget: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greyColor,
                        ),
                      child: const Center(child: Text('error in loading',style: TextStyle(fontSize: 5),)),
                    ),
                    ),
                ),
              ),
              // Container(
              //   width: 35,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     image: DecorationImage(
              //       image: NetworkImage('$baseUrl/$image'),
              //       fit: BoxFit.fill
              //     )
              //   )  ,
              //   ),
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