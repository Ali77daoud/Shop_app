import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/model/auth_models/loginmodel.dart';
import 'package:shop_app/model/auth_models/registermodel.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/services/network/authapi.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/circle_dialog.dart';

class AuthController extends GetxController{
  bool isLogin = false;
  final authBox = GetStorage();
  final firstNameBox = GetStorage();
  final lastNameBox = GetStorage();
  final emailBox = GetStorage();

  
  
  void showCircleDialog(
    {
      required BuildContext context
    }
  ){
    showDialog(
      context: context,
      builder: (context) {
        return circleDialog(
          circleColor: mainColor,
          backgroundColor: whiteColor,
          text:'الرجاء الانتظار'
        );
      },
      );
    update();
  }

  //register
  Future<void> registerApi (
    {
    required String name,
    required String lastName,
    required String email,
    required String password,
    required String repassword,
    required String number,
    } 
  )async{
    try{
      RegisterModel res = await AuthApi.register(
        name: name, 
        lastName: lastName, 
        email: email, 
        password: password, 
        repassword: repassword, 
        number: number
      );
      Get.back(closeOverlays: true);
      isLogin = true;

      authBox.write('auth', isLogin);
      firstNameBox.write('fname', res.user!.firstName);
      lastNameBox.write('lname', res.user!.lastName);
      emailBox.write('email', res.user!.email);

      FocusManager.instance.primaryFocus?.unfocus();
      Get.snackbar(
            'تمت العملية',
            'تم التسجيل بنجاح',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 3)
        );
      Get.offNamed(Routes.mainScreen);
    }catch(e){
      Get.back(closeOverlays: true);
      FocusManager.instance.primaryFocus?.unfocus();
      Get.snackbar(
            'خطأ',
            e.toString().startsWith('SocketException')? 
            'خطأ في الشبكة':'خطأ في تسجيل الحساب , الحساب موجود',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 5)
        );
    }
  }

  //login
  Future<void> loginApi (
    {
    required String email,
    required String password,
    } 
  )async{
    try{
      LoginModel res = await AuthApi.logIn(
        email: email,
        password: password
        );
      Get.back(closeOverlays: true);
      isLogin = true;
      authBox.write('auth', isLogin);
      firstNameBox.write('fname', res.user!.firstName);
      lastNameBox.write('lname', res.user!.lastName);
      emailBox.write('email', res.user!.email);
      FocusManager.instance.primaryFocus?.unfocus();
      Get.snackbar(
            'تمت العملية',
            'تم تسجيل الدخول بنجاح',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 3)
        );
      Get.offNamed(Routes.mainScreen);
    }catch(e){
      Get.back(closeOverlays: true);
      FocusManager.instance.primaryFocus?.unfocus();
      Get.snackbar(
            'خطأ',
            e.toString().startsWith('SocketException')? 
            'خطأ في الشبكة':'خطأ في تسجيل الدخول',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(seconds: 5)
        );
    }
  }
  
  //logout

  void logOut (){
    isLogin=false;
    authBox.write('auth', isLogin);
    firstNameBox.write('fname','');
    firstNameBox.write('lname','');
    firstNameBox.write('email','');
    Get.offAllNamed(Routes.boardingScreen);
  }
}