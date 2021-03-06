import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
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
  final TextEditingController repasskey = TextEditingController();
  final TextEditingController phonekey = TextEditingController();

  final authController = Get.put(AuthController());
  

    

    GoogleSignInAccount? user ;
    String? email;
    String? name;

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
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: double.infinity,
                    height: 550,
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
                            padding: const EdgeInsets.symmetric(horizontal: 20 ),
                            child: Column(
                              children: [
                                const Text('?????????? ????????',
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
                                      return '???????? ?????????? ???? ????????';
                                    }
                                  },
                                decoration: InputDecoration(
                                  hintText: '??????????',
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
                                      return '???????? ?????????? ???? ????????';
                                    }
                                  },
                                decoration: InputDecoration(
                                  hintText: '??????????',
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
                                      return '???????? ???????????? ???????????????????? ???? ????????';
                                    }
                                    else if(!RegExp(validationEmail).hasMatch(value)){
                                    return '???????? ???????? ???????? ???? ????????';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: '???????????? ????????????????????',
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
                                controller: passkey,
                                cursorColor: mainColor,
                                validator: (value){
                                   if(value!.isEmpty){
                                    return '???????? ???????? ???????????? ???? ????????';
                                  }
                                  else if(value.length < 8){
                                    return '???????? ???????? ???????? ???? ???????????? ??????';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: '???????? ????????',
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
                              /////////////////////re-password
                              TextFormField(
                                keyboardType:TextInputType.visiblePassword,
                                controller: repasskey,
                                cursorColor: mainColor,
                                validator: (value){
                                  if(value != passkey.text){
                                    return '???????? ???????????? ?????? ??????????????';
                                  }
                                  else {
                                    return null;
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: '?????????? ???????? ????????',
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
                                controller: phonekey,
                                cursorColor: mainColor,
                                validator: (value){
                                   if(value!.isEmpty){
                                    return '???????? ?????? ????????????  ???? ????????';
                                  }
                                  else if(value.length < 8){
                                    return '???????? ?????? ???????? ???? ???????????? ??????????';
                                  }
                                  },
                                decoration: InputDecoration(
                                  hintText: '?????? ??????????????',
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
                              GetBuilder<AuthController>(
                                builder: (_){
                                  return SizedBox(
                                    width: double.infinity,
                                    child:buttomUtils(
                                          ontab: (){
                                            if(formKey.currentState!.validate()){
                                              authController.showCircleDialog(context: context);
                                              authController.registerApi(
                                                name: namekey.text, 
                                                lastName: nicknamekey.text , 
                                                email: emailkey.text, 
                                                password: passkey.text, 
                                                repassword: repasskey.text, 
                                                number: phonekey.text
                                                );
                                            }
                                            },

                                          childtext: const Text('?????????? ????????'),
                                          maincolor: mainColor,
                                          radius: 25, 
                                          leftpadding: 0, 
                                          rightpadding: 0, 
                                          toppadding: 10, 
                                          buttompadding: 10,
                                          c: mainColor,
                                        ),
                                  );
                                }
                              ),
                              
                              
                              SizedBox(height:h*0.01,),
                              const Text(
                                        '???? ?????????? ????????????????',
                                        style: TextStyle(
                                        color: greyColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal
                                      ),
                                    ),
                              SizedBox(height:h*0.021,),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child:
                                GetBuilder<AuthController>(
                                  builder: (_){ 
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            authController.signinGoogle().then((value){
                                              authController.showCircleDialog(context: context);
                                              authController.registerApi(
                                                name: authController.googleUser!.displayName!.split(' ')[0], 
                                                lastName: authController.googleUser!.displayName!.split(' ')[1] , 
                                                email: authController.googleUser!.email, 
                                                password: '12345678', 
                                                repassword: '12345678', 
                                                number: '099999999'
                                                );
                                            });
                                          },
                                          child: Container(
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
                                        ),
                                        const SizedBox(width:20,),
                                        InkWell(
                                          onTap: (){
                                            authController.signinFacebook().then((value){
                                              authController.showCircleDialog(context: context);
                                              authController.registerApi(
                                                name: authController.facebookUserData!.name!.split(' ')[0], 
                                                lastName: authController.facebookUserData!.name!.split(' ')[1] , 
                                                email: authController.facebookUserData!.email.toString(), 
                                                password: '12345678', 
                                                repassword: '12345678', 
                                                number: '099999999'
                                                );
                                            });
                                          },
                                          child: Container(
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
                                        ),
                                      ],
                                  );
                                  }
                                )
                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
                const SizedBox(height:20,),
                const Text(
                    '???? ???????? ???????? ??',
                    style: TextStyle(
                    color: blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 25),
                  child: SizedBox(
                    width: double.infinity,
                    child: buttomUtils(
                        ontab: (){
                          Get.offNamed(Routes.loginPage);
                        }, 
                        childtext: const Text('?????????? ????????????',
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