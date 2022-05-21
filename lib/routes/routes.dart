
import 'package:get/route_manager.dart';
import 'package:shop_app/view/screens/auth/loginotppage.dart';
import 'package:shop_app/view/screens/auth/loginpage.dart';
import 'package:shop_app/view/screens/auth/signuppage.dart';
import 'package:shop_app/view/screens/auth/verificationpage.dart';
import 'package:shop_app/view/screens/choosepage.dart';
import 'package:shop_app/view/screens/mainscreen/mainscreen.dart';
import 'package:shop_app/view/screens/on_boarding_screen.dart';

class Routes{
  static const boardingScreen = '/boardingScreen';
  static const choosePage = '/choosePage';
  static const loginPage = '/loginPage';
  static const loginOTPPage = '/loginOTPPage';
  static const veriPage = '/veriPage';
  static const signupPage = '/signupPage';
  static const mainScreen = '/mainScreen';
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
      GetPage(
      name: Routes.mainScreen, 
      page: ()=>   MainScreen(),
      ),
  ];
}