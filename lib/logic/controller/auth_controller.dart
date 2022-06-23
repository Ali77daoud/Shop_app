import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/model/auth_models/loginmodel.dart';
import 'package:shop_app/model/auth_models/registermodel.dart';
import 'package:shop_app/model/facebookuserdatamodel.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/services/network/authapi.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/circle_dialog.dart';

class AuthController extends GetxController{
  bool isLogin = false;

  final authBox = GetStorage();
  GetStorage firstNameBox = GetStorage();
  GetStorage lastNameBox = GetStorage();
  GetStorage emailBox = GetStorage();
  GetStorage phoneNumberBox = GetStorage();
  GetStorage imgUrlBox = GetStorage();


  GetStorage token = GetStorage();
  GetStorage ifFacebookSigninBox = GetStorage();
  GetStorage userId = GetStorage();


  
  
  
  
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

  //register\

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

      userId.write('id', res.user!.id);
      Get.back(closeOverlays: true);
      isLogin = true;

      authBox.write('auth', isLogin);
      firstNameBox.write('fname', res.user!.firstName);
      lastNameBox.write('lname', res.user!.lastName);
      emailBox.write('email', res.user!.email);
      phoneNumberBox.write('phone', res.user!.mobileNumber);
      token.write('t', res.accessToken);
      imgUrlBox.write('img', '');

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
      userId.write('id', res.user!.id);
      Get.back(closeOverlays: true);
      isLogin = true;
      authBox.write('auth', isLogin);
      firstNameBox.write('fname', res.user!.firstName);
      lastNameBox.write('lname', res.user!.lastName);
      emailBox.write('email', res.user!.email);
      phoneNumberBox.write('phone', res.user!.mobileNumber);
      token.write('t', res.accessToken);

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
  //google sign in
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;

  Future<void> signinGoogle() async {
      try {
        googleUser = await googleSignIn.signIn();
        if(googleUser == null){
          Get.back(closeOverlays: true);
          throw Exception('no google user');
        }
        update();
      } catch (e) {
        Get.snackbar(
          '',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 5)
        );
      }
  }

  //facebook signin
  FacebookUserModel? facebookUserData;
  AccessToken? accessToken;

  Future<void> signinFacebook() async {
      try {
        final LoginResult result = await FacebookAuth.instance.login();
        if(result.status == LoginStatus.success){
          accessToken = result.accessToken;
          
          final data = await FacebookAuth.instance.getUserData();
          facebookUserData = FacebookUserModel.fromJson(data);
          ifFacebookSigninBox.write('face',true);
          print(facebookUserData!.email.toString());
        }
        else{
          print('not success');
        }
        update();
      } catch (e) {
        Get.snackbar(
          '',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 5)
        );
      }
  }

  //update profile

  bool ifUpdateProfile = false;

  void changeUpdateProfile(bool val){
    ifUpdateProfile = val;
    update();
  }
  
  //logout

  Future<void> logOut ()async{
    try{
      bool? isface = ifFacebookSigninBox.read<bool>('face');

      isLogin=false;
      authBox.write('auth', isLogin);
      firstNameBox.write('fname','');
      lastNameBox.write('lname','');
      emailBox.write('email','');
      phoneNumberBox.write('phone','');
      token.write('t', '');
      userId.write('id', '');
      imgUrlBox.write('img', '');
      //for google sign in
      await googleSignIn.isSignedIn().then((value)async{
        if(value){
          await googleSignIn.disconnect();
          Get.offAllNamed(Routes.boardingScreen);
        }
        else {
          // //for facebook
          if(isface == true)
          {
            ifFacebookSigninBox.write('face',false);
            await FacebookAuth.instance.logOut();
            Get.offAllNamed(Routes.boardingScreen);
            print('yes face book login');
          }
          else
          {
            print('no face book login');
            Get.offAllNamed(Routes.boardingScreen);
          }
        
        }
      }); 
      
  }catch(e){
    Get.snackbar(
          '',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 5)
      );
  }
  
  }
    

  
}