import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/categorypage.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/home.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/productdetails.dart';



class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final pagesController = Get.put(PagesController());
  @override
  Widget build(BuildContext context) {
    return
    GetBuilder<PagesController>(
      builder: (_){
        return 
        IndexedStack(
          index: pagesController.homePageIndex,
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