import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/view/screens/mainscreen/buypage.dart';
import 'package:shop_app/view/screens/mainscreen/homepages/homepage.dart';
import 'package:shop_app/view/screens/mainscreen/personpages/personpage.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/shoppage.dart';




class MainController extends GetxController{
  int mainIndex = 0;

  int i = 0 ;

  String fName = GetStorage().read('fname');
  String lName = GetStorage().read('lname');
  String email = GetStorage().read('email');

  
 
  final pageController = Get.put(PagesController());

  final authController = Get.find<AuthController>();
  // Get.put(AuthController());


  @override
  void onInit() {
    super.onInit();

    int? userId = authController.userId.read<int>('id');
    String? token = authController.token.read<String>('t');

    pageController.getFromCart(
        userId: userId!.toInt(),
        token: token.toString()
    );

  }

  // @override
  // void onInit() async{
  //   super.onInit();

  //     pageController.getFromCart(
  //         userId: 26,
  //         token: token.toString()
  //     );
  // }

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