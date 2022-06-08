import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/logic/controller/mainscreen_controller.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/drawer_items.dart';

Widget customDrawer(){
  final pageController = Get.find<PagesController>();
  final authController = Get.find<AuthController>();
  final mainController = Get.find<MainController>();
  String fName = GetStorage().read('fname');
  String lName = GetStorage().read('lname');
  return Column(
    children: [
      Container(
        height: 200,
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
            Text(lName +'  '+fName,
              style: const TextStyle(
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
        child: Container(
          decoration: const BoxDecoration(
            color: mainColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: 
                Column(
                  children: [
                    SizedBox(
                      height: 230,
                      child: Obx((){
                        return ListView.separated(
                          itemBuilder: (context,index){
                            return drawerItems(
                              ontap: (){
                                pageController.changeGender(index);
                                // pageController.changeCategoryColor(0);
                                // pageController.clothesIndex = 0;
                                // pageController.productDetailsIndex = 0;
                                // mainController.changeScreen(0);
                                Get.back();
                              }, 
                              title: pageController.dataCategoryList[index].translations![0].categoryname.toString(), 
                              image: pageController.dataCategoryList[index].photoName.toString(),
                            );
                          }, 
                          separatorBuilder: (context,index){
                            return const SizedBox(height: 15,);
                          },
                          itemCount: pageController.dataCategoryList.length,
                          );
                      }),
                    ),
                    //////////////////////////////
                    const SizedBox(height: 40,),
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
                      onTap: (){
                        authController.logOut();
                      },
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
                ),
                //     InkWell(
                //         onTap: menButton,
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           children:  [
                //             Container(
                //               width: 28,
                //               height: 28,
                //               decoration: const BoxDecoration(
                //                 image: DecorationImage(
                //                   image: AssetImage('assets/images/man.png'),
                //                   fit: BoxFit.contain
                //                   )
                //               ),
                //             ),
                //             const SizedBox(width: 20,),
                //             const Text('رجال',
                //               style : TextStyle(
                //               color: whiteColor,
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold
                //             ),
                //             )
                //           ],
                //         ),
                //   ),
                
                // const SizedBox(height: 15,),
                // InkWell(
                //   onTap: womenButton,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //           width: 27,
                //           height: 27,
                //           decoration: const BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage('assets/images/woman.png'),
                //               fit: BoxFit.contain
                //               )
                //           ),
                //         ),
                //       const SizedBox(width: 20,),
                //       const Text('نساء',
                //         style : TextStyle(
                //         color: whiteColor,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // InkWell(
                //   onTap: kidsButton ,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children:  [
                //       Container(
                //           width: 27,
                //           height: 27,
                //           decoration: const BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage('assets/images/son.png'),
                //               fit: BoxFit.contain
                //               )
                //           ),
                //         ),
                //       const SizedBox(width: 20,),
                //       const Text('أطفال',
                //         style : TextStyle(
                //         color: whiteColor,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // InkWell(
                //   onTap: jewelleryButton,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //           width: 27,
                //           height: 27,
                //           decoration: const BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage('assets/images/jewelry.png'),
                //               fit: BoxFit.contain
                //               )
                //           ),
                //         ),
                //       const SizedBox(width: 20,),
                //       const Text('إكسسوارات',
                //         style : TextStyle(
                //         color: whiteColor,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold
                //       ),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 15,),
                // InkWell(
                //   onTap: electronicButton,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Container(
                //           width: 27,
                //           height: 27,
                //           decoration: const BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage('assets/images/electronics.png'),
                //               fit: BoxFit.contain
                //               )
                //           ),
                //         ),
                //       const SizedBox(width: 20,),
                //       const Text('إلكترونيات',
                //         style : TextStyle(
                //         color: whiteColor,
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold
                //       ),
                //       )
                //     ],
                //   ),
                // ),
      
                
          ),
        ),
      )
    ],
  );
}