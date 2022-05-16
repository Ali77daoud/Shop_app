import 'package:get/route_manager.dart';
import 'package:shop_app/view/screens/auth/loginpage.dart';
import 'package:shop_app/view/screens/choosepage.dart';
import 'package:shop_app/view/screens/on_boarding_screen.dart';

class Routes{
  static const boardingScreen = '/boardingScreen';
  static const choosePage = '/choosePage';
  static const loginPage = '/loginPage';
  // static const signupPage = '/signupPage';
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
      // GetPage(
      // name: Routes.loginPage, 
      // page: ()=>   LoginPage(),
      // ),
  ];
}