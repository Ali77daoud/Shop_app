import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 20),
          child: SingleChildScrollView(
            child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.shopping_cart_rounded,size: 45,color:mainColor,),
                    ),
                      SizedBox(width: 10,),
                      Text('Outletship',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      )
                     
                  ],
                ),
              SizedBox(height: h*0.15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:const [
                       BoxShadow(
                      color: greyColor,
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    )
                    ]
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buttomUtils(
                          ontab: (){
                            Get.offNamed(Routes.loginPage);
                          }, 
                          childtext: const Text('مشتري',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: whiteColor,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ), 
                          maincolor: mainColor, 
                          radius: 20, 
                          leftpadding: 35, 
                          rightpadding:35, 
                          toppadding: 5, 
                          buttompadding: 5,
                          c: mainColor
                          ),
                          const SizedBox(height: 10,),
                          buttomUtils(
                          ontab: (){
                            Get.offNamed(Routes.loginPage);
                          }, 
                          childtext: const Text('بائع',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: blackColor,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ), 
                          maincolor: whiteColor, 
                          radius: 20, 
                          leftpadding: 35, 
                          rightpadding:35, 
                          toppadding: 5, 
                          buttompadding: 5,
                          c: mainColor
                          ),
                      ],
                    ),
                ),
              )
            ],
            ),
          ),
        ),
      ),
    );
  }
}