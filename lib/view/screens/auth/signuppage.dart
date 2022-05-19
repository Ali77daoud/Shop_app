import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/string.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

class SignupPage extends StatelessWidget {
  SignupPage({ Key? key }) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController namekey = TextEditingController();
  final TextEditingController nicknamekey = TextEditingController();
  final TextEditingController emailkey = TextEditingController();
  final TextEditingController passkey = TextEditingController();
  final TextEditingController phonekey = TextEditingController();
  final TextEditingController postalkey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: whiteColor,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 20),
            child: SingleChildScrollView(
              child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                      Text('Outletship',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10,),
                      Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(Icons.shopping_cart_rounded,size: 45,color:mainColor,),
                    ),
                     
                  ],
                ),
                SizedBox(height: h*0.08,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: double.infinity,
                    height: 455,
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
                                const Text('إنشاء حساب',
                                style: TextStyle(
                                  color: blackColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height:10,),
                              ///////////////////////////// name
                              TextFormField(
                                keyboardType:TextInputType.text,
                                controller: namekey,
                                cursorColor: mainColor,
                                validator: (value){
                                    if(value!.isEmpty){
                                      return 'أدخل الاسم من فضلك';
                                    }
                                  },
                                decoration: InputDecoration(
                                  hintText: 'الاسم',
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 15
                                  ),
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: lightGreyColor2),   
                                ),  
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                ),
                              ),
                              SizedBox(height:h*0.01,),
                              /////////////////////nickname
                              TextFormField(
                                keyboardType:TextInputType.text,
                                controller: nicknamekey,
                                cursorColor: mainColor,
                                validator: (value){
                                    if(value!.isEmpty){
                                      return 'أدخل اللقب من فضلك';
                                    }
                                  },
                                decoration: InputDecoration(
                                  hintText: 'اللقب',
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 15
                                  ),
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: lightGreyColor2),   
                                ),  
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                ),
                              ),
                              /////////////////////
                              SizedBox(height:h*0.01,),
                              /////////////////////email
                              TextFormField(
                                keyboardType:TextInputType.emailAddress,
                                controller: emailkey,
                                cursorColor: mainColor,
                                validator: (value){
                                    if(value!.isEmpty){
                                      return 'أدخل البريد الإلكتروني من فضلك';
                                    }
                                    else if(!RegExp(validationEmail).hasMatch(value)){
                                    return 'أدخل بريد صحيح من فضلك';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: 'البريد الإلكتروني',
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 15
                                  ),
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: lightGreyColor2),   
                                ),  
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                ),
                              ),
                              ////////////////////////////
                              SizedBox(height:h*0.01,),
                              /////////////////////password
                              TextFormField(
                                keyboardType:TextInputType.visiblePassword,
                                controller: emailkey,
                                cursorColor: mainColor,
                                validator: (value){
                                   if(value!.isEmpty){
                                    return 'أدخل كلمة المرور من فضلك';
                                  }
                                  else if(value.length < 8){
                                    return 'أدخل كلمة مرور من ثمانية حرف';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: 'كلمة السر',
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 15
                                  ),
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: lightGreyColor2),   
                                ),  
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                ),
                              ),
                              ///////////////////////
                              ///////////////////////////////
                              SizedBox(height:h*0.01,),
                              /////////////////////phone
                              TextFormField(
                                keyboardType:TextInputType.phone,
                                controller: passkey,
                                cursorColor: mainColor,
                                validator: (value){
                                   if(value!.isEmpty){
                                    return 'أدخل رقم الهاتف  من فضلك';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: 'رقم الخليوي',
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 15
                                  ),
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: lightGreyColor2),   
                                ),  
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                ),
                              ),
                              ///////////////////////
                              SizedBox(height:h*0.01,),
                              /////////////////////postal code
                              TextFormField(
                                keyboardType:TextInputType.text,
                                controller: postalkey,
                                cursorColor: mainColor,
                                validator: (value){
                                   if(value!.isEmpty){
                                    return 'أدخل رمز البريد  من فضلك';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: 'الرمز البريدي',
                                  contentPadding: const EdgeInsets.only(top: 10),
                                  hintStyle: const TextStyle(
                                    fontSize: 15
                                  ),
                                  filled: false,
                                  enabledBorder: UnderlineInputBorder(      
                                  borderSide: BorderSide(color: lightGreyColor2),   
                                ),  
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: lightGreyColor2),
                                ),
                                ),
                              ),
                              ///////////////////////
                              SizedBox(height:h*0.02,),
                              SizedBox(
                                width: double.infinity,
                                child: buttomUtils(
                                      ontab: (){
                                        Get.offNamed(Routes.mainScreen);
                                        },

                                      childtext: const Text('إنشاء حساب'),
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
                                    const SizedBox(width:20,),
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
                SizedBox(height:h*0.021,),
                const Text(
                    'هل لديك حساب ؟',
                    style: TextStyle(
                    color: blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height:h*0.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: SizedBox(
                    width: double.infinity,
                    child: buttomUtils(
                        ontab: (){
                          Get.toNamed(Routes.loginPage);
                        }, 
                        childtext: const Text('تسجيل الدخول',
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
      ),
    );
  }
}