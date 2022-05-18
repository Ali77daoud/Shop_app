import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';
import 'package:shop_app/view/widget/textformfeild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({ Key? key }) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailkey = TextEditingController();
  final TextEditingController passwordkey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 20),
          child: SingleChildScrollView(
            child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.shopping_cart_rounded,size: 45,color:mainColor,),
                    ),
                      SizedBox(width: 10,),
                      Text('Outletship',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      )
                     
                  ],
                ),
              SizedBox(height: h*0.15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:const [
                       BoxShadow(
                      color: greyColor,
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                    )
                    ]
                      ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const Text('تسجيل الدخول',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height:10,),
                            /////////////////////////////
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: defualTextFormFeild(
                                controller: emailkey, 
                                inputtype: TextInputType.visiblePassword, 
                                maxlines: 1, 
                                ifobscure: false, 
                                validate: (value){
                                  if(value.isEmpty){
                                    return 'أدخل البريد من فضلك';
                                  }
                                  else if(!RegExp(validationEmail).hasMatch(value)){
                                    return 'أدخل بريد صحيح من فضلك';
                                  }
                                },  
                                label:'البريد الإلكتروني',
                                hint: '', 
                                labelcolor: greyColor, 
                                inputtextcolor: blackColor, 
                                prifixicon:const Icon(Icons.person_pin,color: greyColor, ),
                                sufixicon: Container(width: 0,),
                                ontab: (){},  
                                cursorColor:mainColor, 
                                backgrouncolor: whiteColor,
                                borderraduis: 20,
                                bordercolor: Colors.grey.shade300,
                                focusbordercolor: mainColor,
                                padding:  const EdgeInsets.only(top: 10),
                                ),
                            ),
                            SizedBox(height:h*0.02,),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: defualTextFormFeild(
                                controller: passwordkey, 
                                inputtype: TextInputType.emailAddress, 
                                maxlines: 1, 
                                ifobscure: false, 
                                validate: (value){
                                  if(value.isEmpty){
                                    return 'أدخل كلمة المرور من فضلك';
                                  }
                                  else if(value.length < 8){
                                    return 'أدخل كلمة مرور من ثمانية حرف';
                                  }
                                },  
                                label:'كلمة السر',
                                hint: '', 
                                labelcolor: greyColor, 
                                inputtextcolor: blackColor, 
                                prifixicon:const Icon(Icons.lock,color: greyColor, ),
                                sufixicon: Container(width: 0,),
                                ontab: (){},  
                                cursorColor:mainColor, 
                                backgrouncolor: whiteColor,
                                borderraduis: 20,
                                bordercolor: Colors.grey.shade300,
                                focusbordercolor: mainColor,
                                padding:  const EdgeInsets.only(top: 10),
                                ),
                            ),
                            /////////////////////
                            SizedBox(height:h*0.02,),
                            SizedBox(
                              width: double.infinity,
                              child: buttomUtils(
                                    ontab: (){
                                      Get.offNamed(Routes.mainScreen);
                                      },

                                    childtext: const Text('تسجيل الدخول'),
                                    maincolor: mainColor,
                                    radius: 25, 
                                    leftpadding: 0, 
                                    rightpadding: 0, 
                                    toppadding: 10, 
                                    buttompadding: 10,
                                    c: mainColor,
                                  ),
                            ),
                            SizedBox(height:h*0.01,),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                      ' هل نسيت كلمة السر؟',
                                      style: TextStyle(
                                      color: blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                      ),
                                    
                                  const Text(
                                      '|',
                                      style: TextStyle(
                                      color: blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                      ),
                                  TextButton(
                                    onPressed: (){
                                      Get.toNamed(Routes.loginOTPPage);
                                    },
                                    child: const Text(
                                      'تسجيل OTP ',
                                      style: TextStyle(
                                      color: blackColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                      ),
                                  ),
                                  
                                ],
                              ),
                            ),
                            SizedBox(height:h*0.01,),
                            const Text(
                                      'أو تسجيل باستخدام',
                                      style: TextStyle(
                                      color: greyColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal
                                    ),
                                  ),
                            SizedBox(height:h*0.021,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: mainColor
                                    ),
                                    child: const Center(
                                      child:  Text(
                                          'f',
                                          style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width:20,),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      color: mainColor
                                    ),
                                    child:  const Center(
                                      child:  Text(
                                          'G',
                                          style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ),
              ),
              const SizedBox(height:30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SizedBox(
                  width: double.infinity,
                  child: buttomUtils(
                      ontab: (){
                        Get.toNamed(Routes.signupPage);
                      }, 
                      childtext: const Text('إنشاء حساب',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: blackColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ), 
                      maincolor: whiteColor, 
                      radius: 18, 
                      leftpadding: 0, 
                      rightpadding:0, 
                      toppadding: 5, 
                      buttompadding: 5,
                      c: mainColor
                      ),
                ),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}