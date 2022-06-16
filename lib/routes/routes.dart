import 'package:get/route_manager.dart';
import 'package:shop_app/view/screens/auth/loginotppage.dart';
import 'package:shop_app/view/screens/auth/loginpage.dart';
import 'package:shop_app/view/screens/auth/signuppage.dart';
import 'package:shop_app/view/screens/auth/verificationpage.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/categoryscreens/categoryscreen.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/productdetailscreen/productscreen.dart';
import 'package:shop_app/view/screens/mainscreen/mainscreen.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/orderacceptscreens/orderacceptscreen.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/ordertrackingscreens/ordertrackingscreen.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/payment1screens/payment1screen.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/payment2screens/payment2screen.dart';
import 'package:shop_app/view/screens/on_boarding_screen.dart';

class Routes{
  static const boardingScreen = '/boardingScreen';
  static const choosePage = '/choosePage';
  static const loginPage = '/loginPage';
  static const loginOTPPage = '/loginOTPPage';
  static const veriPage = '/veriPage';
  static const signupPage = '/signupPage';
  static const mainScreen = '/mainScreen';

  static const homeScreen = '/homeScreen';
  static const categoryScreen = '/categoryScreen';
  static const productScreen = '/productScreen';

  static const shopScreen = '/shopScreen';
  static const payment1Screen = '/payment1Screen';
  static const payment2Screen = '/payment2Screen';
  static const orderAcceptScreen = '/orderAcceptScreen';
  static const orderTrackingScreen = '/orderTrackingScreen';
}

class AppRoutes{

  static final routes = [
    GetPage(
      name: Routes.boardingScreen, 
      page: ()=>  const OnBoardingScreen(),
      ),
      // GetPage(
      // name: Routes.choosePage, 
      // page: ()=>  ChoosePage(),
      // transition: Transition.fade,
      // transitionDuration: const Duration(milliseconds: 800),
      // ),
      GetPage(
      name: Routes.loginPage, 
      page: ()=>   LoginPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
      ),
      GetPage(
      name: Routes.loginOTPPage, 
      page: ()=>   LoginOtpPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
      ),
      GetPage(
      name: Routes.veriPage, 
      page: ()=>   VeriPage(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),
      GetPage(
      name: Routes.signupPage, 
      page: ()=>   SignupPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
      ),

      GetPage(
      name: Routes.mainScreen,
      page: ()=>   MainScreen(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 200),
      ),
    //homepages

      GetPage(
      name: Routes.categoryScreen, 
      page: ()=>   CategoryScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),

      GetPage(
      name: Routes.productScreen, 
      page: ()=>   ProductScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),

      //shoppages
      GetPage(
      name: Routes.payment1Screen ,
      page: ()=>   Payment1Screen(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),

      GetPage(
      name: Routes.payment2Screen ,
      page: ()=>   Payment2Screen(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),

      GetPage(
      name: Routes.orderAcceptScreen ,
      page: ()=>   OrderAcceptScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),

      GetPage(
      name: Routes.orderTrackingScreen ,
      page: ()=>   OrderTrackingScreen(),
      popGesture: true,
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      ),

  ];
}