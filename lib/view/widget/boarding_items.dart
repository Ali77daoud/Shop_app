import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/boarding_model.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget boarderItems(
  OnBoardingModel model,
  var context,
  var boarderController,
  int length,
  ) => Stack(
    children: [
      Container(
      width: double.infinity,
      height:MediaQuery.of(context).size.height*0.77 ,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:AssetImage(model.image),
          fit: BoxFit.cover
          ),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight:Radius.circular(45) ),
      ),
    ),
    Container(
        width: double.infinity,
        height:MediaQuery.of(context).size.height*0.77 ,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight:Radius.circular(45) ),
        ),
    ),
    Padding(
      padding: const EdgeInsets.only(left: 15,top: 15),
      child: Align(
        alignment: Alignment.topLeft,
        child: SmoothPageIndicator(
          controller: boarderController,
          count: length,
          effect: const SlideEffect(
            dotColor: greyColor,
            activeDotColor: mainColor,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5, 
            paintStyle: PaintingStyle.stroke,
            ),
        ),
      ),
    ),
    Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color:whiteColor)
                    ),
                  child:
                      const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(Icons.shopping_cart_rounded,size: 45,color: whiteColor,),
                      )
                      
                  ),
                  const SizedBox(width: 10,),
                  const Text('Outletship',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  )
                 
              ],
            ),
          SizedBox(height: MediaQuery.of(context).size.height*0.3 ,),
          Text(model.title,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 20,
                ),
              ),
          Text(model.body,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
            
        ],
      ),
    ),
    
    ],
  );