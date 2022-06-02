
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:shop_app/view/screens/auth/loginotppage.dart';
import 'package:shop_app/view/screens/auth/loginpage.dart';
import 'package:shop_app/view/screens/auth/signuppage.dart';
import 'package:shop_app/view/screens/auth/verificationpage.dart';
import 'package:shop_app/view/screens/choosepage.dart';
import 'package:shop_app/view/screens/categoryscreens/categoryscreen.dart';
import 'package:shop_app/view/screens/homeScreens/homescreen.dart';
import 'package:shop_app/view/screens/on_boarding_screen.dart';
import 'package:shop_app/view/screens/productdetailscreens/productdetailscreen.dart';
import 'package:shop_app/view/screens/test1.dart';
import 'package:shop_app/view/screens/test2.dart';
import 'package:shop_app/view/test3.dart';

class Routes{
  static const boardingScreen = '/boardingScreen';
  static const choosePage = '/choosePage';
  static const loginPage = '/loginPage';
  static const loginOTPPage = '/loginOTPPage';
  static const veriPage = '/veriPage';
  static const signupPage = '/signupPage';
  static const homeScreen = '/homeScreen';
  static const categoryScreen = '/categoryScreen';
  static const productScreen = '/productScreen';

  // static const homePage = '/homePage';
  // static const categoryPage = '/homePage';
  // static const productPage = '/homePage';


  static const test1 = '/test1';
  static const test2 = '/test2';
  static const test3 = '/test3';
}

class AppRoutes{

  static final routes = [
    GetPage(
      name: Routes.boardingScreen, 
      page: ()=>  const OnBoardingScreen(),
      ),
      GetPage(
      name: Routes.choosePage, 
      page: ()=>  const ChoosePage(),
      ),
      GetPage(
      name: Routes.loginPage, 
      page: ()=>   LoginPage(),
      ),
      GetPage(
      name: Routes.loginOTPPage, 
      page: ()=>   LoginOtpPage(),
      ),
      GetPage(
      name: Routes.veriPage, 
      page: ()=>   VeriPage(),
      ),
      GetPage(
      name: Routes.signupPage, 
      page: ()=>   SignupPage(),
      ),

    //homepages
      GetPage(
      name: Routes.homeScreen, 
      page: ()=>   HomeScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      curve: Curves.linear,
      transitionDuration: const Duration(milliseconds: 400),
      ),

      GetPage(
      name: Routes.categoryScreen, 
      page: ()=>   CategoryScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      curve: Curves.linear,
      transitionDuration: const Duration(milliseconds: 400),
      ),

      GetPage(
      name: Routes.productScreen, 
      page: ()=>   ProductScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      curve: Curves.linear,
      transitionDuration: const Duration(milliseconds: 400),
      ),


      
      // GetPage(
      // name: Routes.homePage, 
      // page: ()=>   HomePage(),
      // ),
      // GetPage(
      // name: Routes.categoryPage, 
      // page: ()=>   CategoryPage(),
      // ),
      // GetPage(
      // name: Routes.productPage, 
      // page: ()=>   ProductDetails(),
      // ),



      GetPage(
      name: Routes.test1, 
      page: ()=>   Test1(),
      popGesture: true,
      transition: Transition.cupertino,
      curve: Curves.linear,
      transitionDuration: const Duration(milliseconds: 400),

      ),
      GetPage(
      name: Routes.test2 ,
      page: ()=>   Test2(),
      popGesture: true,
      transition: Transition.cupertino,
      curve: Curves.linear,
      transitionDuration: const Duration(milliseconds: 400),
      ),
      GetPage(
      name: Routes.test3, 
      page: ()=>   Test3(),
      popGesture: true,
      transition: Transition.cupertino,
      curve: Curves.linear,
      transitionDuration: const Duration(milliseconds: 400),
      ),
  ];
}