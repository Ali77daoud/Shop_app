import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';

Widget customDrawer(
  {
    required var menButton,
    required var womenButton,
    required var kidsButton,
    required var jewelleryButton,
    required var electronicButton,
  }
){
  final pagesController = Get.find<PagesController>();
  return Column(
    children: [
      Container(
        height: 180,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: main2Color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: whiteColor,
                  width: 3
                  ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover
                ),
              
              ),
            ),
            const Text('aaa aaaa',
              style: TextStyle(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
    )
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: 1,
        decoration: BoxDecoration(
          color: mainColor,
          boxShadow:[
                BoxShadow(
                color: lightGreyColor1,
                offset: const Offset(
                  0,
                  0,
                ),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              )
            ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(
            color: mainColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: SingleChildScrollView(
              child: 
              GetBuilder<PagesController>(
                builder: (_){
                  return Column(
                children: [
                      InkWell(
                          onTap: menButton,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Container(
                                width: 28,
                                height: 28,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/man.png'),
                                    fit: BoxFit.contain
                                    )
                                ),
                              ),
                              const SizedBox(width: 20,),
                              const Text('رجال',
                                style : TextStyle(
                                color: whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                              )
                            ],
                          ),
                    ),
                  
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: womenButton,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 27,
                            height: 27,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/woman.png'),
                                fit: BoxFit.contain
                                )
                            ),
                          ),
                        const SizedBox(width: 20,),
                        const Text('نساء',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: kidsButton ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        Container(
                            width: 27,
                            height: 27,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/son.png'),
                                fit: BoxFit.contain
                                )
                            ),
                          ),
                        const SizedBox(width: 20,),
                        const Text('أطفال',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: jewelleryButton,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 27,
                            height: 27,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/jewelry.png'),
                                fit: BoxFit.contain
                                )
                            ),
                          ),
                        const SizedBox(width: 20,),
                        const Text('إكسسوارات',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: electronicButton,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 27,
                            height: 27,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/electronics.png'),
                                fit: BoxFit.contain
                                )
                            ),
                          ),
                        const SizedBox(width: 20,),
                        const Text('إلكترونيات',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      // Get.toNamed(Routes.orderTrackingScreen);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.track_changes,color: whiteColor,),
                        SizedBox(width: 20,),
                        Text('تتبع الطلب',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.call,color: whiteColor,),
                        SizedBox(width: 20,),
                        Text('اتصل بنا',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.info,color: whiteColor,),
                        SizedBox(width: 20,),
                        Text('معلومات عنا',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.logout,color: whiteColor,),
                        SizedBox(width: 20,),
                        Text('تسجيل الخروج',
                          style : TextStyle(
                          color: whiteColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              );
                }
                )
              
            ),
          ),
        ),
      )
    ],
  );
}