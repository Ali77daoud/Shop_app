import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/mainscreen_controller.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/orderacceptscreens/orderaccept.dart';
import 'package:shop_app/view/widget/buttom_navigation_bar.dart';
import 'package:shop_app/view/widget/cusomdrawer.dart';

class OrderAcceptScreen extends StatelessWidget {
  OrderAcceptScreen({ Key? key }) : super(key: key);
  final mainController = Get.find<MainController>();
  final pagesController = Get.find<PagesController>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: whiteColor,
      child: SafeArea(
        child:
        GetBuilder<MainController>(
          builder: (_){
            return
            Scaffold(
              appBar: AppBar(
              iconTheme: const IconThemeData(color: blackColor),
              backgroundColor: whiteColor,
              title: Row(
                children: [
                const SizedBox(width: 5,),
                IconButton(
                  onPressed:(){} ,
                  icon: const Icon( Icons.search,size: 25,color:blackColor,),
                  ),
                ],
              ),
              centerTitle: false,
              titleSpacing: 0.0, 
              actions:  [
                Transform(
                transform:  Matrix4.translationValues(5.0, 0.0, 0.0),
                child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                            Text('Outletship',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          SizedBox(width: 10,),
                          Icon(Icons.shopping_cart_rounded,size: 35,color:mainColor,),
                        ],
                      ),
              ),
              
              ],  
              elevation: 1,
            ),
            drawer: Padding(
              padding: EdgeInsets.only(bottom: h*0.08),
              child: SizedBox(
                width: w*0.73,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35), bottomLeft: Radius.circular(35)),
                  child: Drawer(
                    child:customDrawer(
                      // menButton: (){
                      //   pagesController.changeGender(0);
                      //   pagesController.changeCategoryColor(0);
                      //   pagesController.clothesIndex = 0;
                      //   pagesController.productDetailsIndex = 0;
                      //   mainController.changeScreen(0).then((value){
                      //     Get.back();
                      //     Get.back();
                      //     Get.back();
                      //     Get.offNamed((Routes.mainScreen));
                      //     Get.back();
                      //   });
                      // }
                      // ,
                      // womenButton: (){
                      //   pagesController.changeGender(1);
                      //   pagesController.changeCategoryColor(0);
                      //   pagesController.clothesIndex = 0;
                      //   pagesController.productDetailsIndex = 0;
                      //   mainController.changeScreen(0).then((value){
                      //     Get.back();
                      //     Get.back();
                      //     Get.back();
                      //     Get.offNamed((Routes.mainScreen));
                      //     Get.back();
                      //   });
                      // },
                      // kidsButton: (){
                      //   pagesController.changeGender(2);
                      //   pagesController.changeCategoryColor(0);
                      //   pagesController.clothesIndex = 0;
                      //   pagesController.productDetailsIndex = 0;
                      //   mainController.changeScreen(0).then((value){
                      //     Get.back();
                      //     Get.back();
                      //     Get.back();
                      //     Get.offNamed((Routes.mainScreen));
                      //     Get.back();
                      //   });
                      // },
                      // jewelleryButton: (){
                      //   pagesController.changeGender(3);
                      //   pagesController.changeCategoryColor(0);
                      //   pagesController.clothesIndex = 0;
                      //   pagesController.productDetailsIndex = 0;
                      //   mainController.changeScreen(0).then((value){
                      //     Get.back();
                      //     Get.back();
                      //     Get.back();
                      //     Get.offNamed((Routes.mainScreen));
                      //     Get.back();
                      //   });
                      // },
                      // electronicButton: (){
                      //   pagesController.changeGender(4);
                      //   pagesController.changeCategoryColor(0);
                      //   pagesController.clothesIndex = 0;
                      //   pagesController.productDetailsIndex = 0;
                      //   mainController.changeScreen(0).then((value){
                      //     Get.back();
                      //     Get.back();
                      //     Get.back();
                      //     Get.offNamed((Routes.mainScreen));
                      //     Get.back();
                      //   });
                      // },
                      // context: context,
                    )
                  ),
                ),
              ),
            ),
            bottomNavigationBar:
            CustomButtomNavBar(
              ontap: (index){
                      //are you sure you want to quit payment
                      mainController.changeScreen(index).then((value){
                        Get.back();
                        Get.back();
                        Get.offNamed((Routes.mainScreen));
                        Get.back();
                      });
                    },
                fixedColor: greyColor ,
                iconSize: 23 ,
                unselectedColor: greyColor,
              ),
            // BottomNavigationBar(
            //         items: const [
            //               BottomNavigationBarItem(icon:Icon(Icons.home),label: '' ),
            //               BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_sharp),label: '' ),
            //               BottomNavigationBarItem(icon:Icon(Icons.assignment_returned),label: '' ),
            //               BottomNavigationBarItem(icon:Icon(Icons.person_pin),label: '' ),
            //             ],
            //         iconSize: 23,
            //         onTap: (index){
            //           //are you sure you want to quit payment
            //           mainController.changeScreen(index).then((value){
            //             Get.back();
            //             Get.back();
            //             Get.offNamed((Routes.mainScreen));
            //             Get.back();
            //           });
            //         },
            //         type: BottomNavigationBarType.fixed,
            //         fixedColor: greyColor,
            //         unselectedItemColor: greyColor,
            //       ) ,
            body:OrderAccept(),
        
      );
      }
      )
      ),
    );
  }
}