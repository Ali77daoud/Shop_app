import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

class OrederTracking extends StatelessWidget {
  OrederTracking({ Key? key }) : super(key: key);
  
  final pagesController = Get.find<PagesController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GetBuilder<PagesController>(
                  builder: (_){
                    return IconButton(
                  onPressed: (){
                    pagesController.changeShopPage(0);
                  }, 
                  icon: const Icon(Icons.arrow_back),
                  );
                  }
                  ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('تتبع الطلب',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 15,)
                    ],
                  ),
                ),
              ],
            ),
            const Text('طلب رقم 333333',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('تم الشحن',
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          Text('خارج للتوصيل',
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                          Text('تم التوصيل',
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          width: 2,
                          color: mainColor,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: mainColor
                                    ),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  color: greyColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        Container(
                          height: 130,
                          width: 2,
                          color: greyColor,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: greyColor
                                    ),
                                ),
                              ),
                              // Container(
                              //   height: 20,
                              //   width: 20,
                              //   decoration: const BoxDecoration(
                              //     color: greyColor,
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),
                          ],
                        ),
                        Container(
                          height: 130,
                          width: 2,
                          color: greyColor,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: greyColor
                                    ),
                                ),
                              ),
                              // Container(
                              //   height: 20,
                              //   width: 20,
                              //   decoration: const BoxDecoration(
                              //     color: greyColor,
                              //     shape: BoxShape.circle,
                              //   ),
                              // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child:  SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('2022-1-22',
                                maxLines: 2,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                              Text('15:3',
                                maxLines: 2,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('2022-1-22',
                                maxLines: 2,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                              Text('15:3',
                                maxLines: 2,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('2022-1-22',
                                maxLines: 2,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                              Text('15:3',
                                maxLines: 2,
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<PagesController>(
              builder: (_){
              return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: buttomUtils(
                      ontab: (){  

                        },
                      childtext: const Text('متابعة التسوق'),
                      maincolor: mainColor,
                      radius: 25, 
                      leftpadding: 0, 
                      rightpadding: 0, 
                      toppadding: 8, 
                      buttompadding: 8,
                      c: mainColor,
                    ),
              ),
            );
            }
            )
            
          ],
        ),
      ),
    );
  }
}