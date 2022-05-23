import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/navcontroller.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/categorypage.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/home.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/productdetails.dart';



class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final navController = Get.put(NavController());
  @override
  Widget build(BuildContext context) {
    return
    GetBuilder<NavController>(
      builder: (_){
        return 
        IndexedStack(
          index: navController.homePageIndex,
          children: [
            Home(),
            CategoryPage(),
            ProductDetails(),
          ],
        );  
      }
      );
  }
}