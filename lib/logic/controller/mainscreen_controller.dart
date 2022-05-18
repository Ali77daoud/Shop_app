import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/screens/mainscreen/buypage.dart';
import 'package:shop_app/view/screens/mainscreen/homepage.dart';
import 'package:shop_app/view/screens/mainscreen/personpage.dart';
import 'package:shop_app/view/screens/mainscreen/shoppage.dart';

class MainController extends GetxController{
  int i = 0;

  int selectedIndex = 0;

  var currentPage = 0;

  List<Widget> screens = [
    HomePage(),
    ShopPage(),
    BuyPage(),
    PersonPage(),
  ];

  List<String> appbarText = [
    'Messages',
    'Person',
    'Settings',
    'buy',
  ];

  void changeScreen(int index){
    i = index;
    update();
  }

  void changeColor(int index){
    selectedIndex = index;
    update();
  }

}