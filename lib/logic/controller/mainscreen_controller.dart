import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/view/screens/mainscreen/buypage.dart';
import 'package:shop_app/view/screens/categoryscreens/categorypage.dart';
import 'package:shop_app/view/screens/homeScreens/homepage.dart';
import 'package:shop_app/view/screens/mainscreen/personpage.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/shoppage.dart';
import 'package:shop_app/view/screens/productdetailscreens/productdetails.dart';


class MainController extends GetxController{
  int i = 0;
  var currentPage = 0;

  List<Widget> screens1 = [
    HomePage(),
    ShopPage(),
    BuyPage(),
    PersonPage(),
  ];

  List<Widget> screens2 = [
    CategoryPage(),
    ShopPage(),
    BuyPage(),
    PersonPage(),
  ];

  List<Widget> screens3 = [
    ProductDetails(),
    ShopPage(),
    BuyPage(),
    PersonPage(),
  ];


  void changeScreen(int index){
    i = index;
    update();
  }

  

}