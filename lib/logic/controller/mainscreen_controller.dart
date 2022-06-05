import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/view/screens/mainscreen/buypage.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/homepage.dart';
import 'package:shop_app/view/screens/mainscreen/personpage.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/shoppage.dart';




class MainController extends GetxController{
  int mainIndex = 0;

  int i = 0 ;

  var currentPage = 0;

  List<Widget> screens1 = [
    HomePage(),
    ShopPage(),
    BuyPage(),
    PersonPage(),
  ];


  Future<void> changeScreen(int index)async{
    mainIndex = index;
    update();
  }


  

}