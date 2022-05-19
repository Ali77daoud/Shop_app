import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';
import 'package:shop_app/view/widget/textformfeild.dart';

class LoginOtpPage extends StatefulWidget {
  LoginOtpPage({ Key? key }) : super(key: key);

  @override
  State<LoginOtpPage> createState() => _LoginOtpPageState();
}

class _LoginOtpPageState extends State<LoginOtpPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController phonekey = TextEditingController();

  String countryName = 'السعودية';

  String countryCode = '+966';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
              SizedBox(height: h*0.15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
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
                            SizedBox(height:h*0.012,),
                            //////////////////////////////
                            Container(
                              height:47,
                              width: double.infinity,
                              decoration:BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CountryCodePicker(
                                    initialSelection: 'SA',
                                    padding: const EdgeInsets.only(left: 0),
                                    flagWidth: 27,
                                    onChanged:(value) {
                                      setState(() {
                                        countryName=value.name.toString();
                                        countryCode=value.dialCode.toString();
                                      });
                                    }, 
                                    favorite: const ['+996','SA'],
                                    showCountryOnly: false,
                                    showFlagMain: true,
                                    showDropDownButton: true,
                                    hideMainText: true,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: true,
                                  ),
                                  Text(countryName,
                                  style: const TextStyle(
                                  color: blackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal
                                ),
                                  ),
                                
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(countryCode,
                                    style: const TextStyle(
                                    color: blackColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                            SizedBox(height:h*0.02,),
                            /////////////////////////////
                            defualTextFormFeild(
                              controller: phonekey, 
                              inputtype: TextInputType.phone, 
                              maxlines: 1, 
                              ifobscure: false, 
                              validate: (value){
                                if(value.isEmpty){
                                  return 'أدخل الرقم من فضلك';
                                }
                              },  
                              label:'رقم الهاتف',
                              hint: '', 
                              labelcolor: greyColor, 
                              inputtextcolor: blackColor, 
                              prifixicon:const Icon(Icons.phone,color: greyColor, ),
                              sufixicon: Container(width: 0,),
                              ontab: (){},  
                              cursorColor:mainColor, 
                              backgrouncolor: whiteColor,
                              borderraduis: 20,
                              bordercolor: Colors.grey.shade300,
                              focusbordercolor: mainColor,
                              padding:  const EdgeInsets.only(top: 10),
                              ),
                            
                            SizedBox(height:h*0.03,),
                            SizedBox(
                              width: w*0.3,
                              child: buttomUtils(
                                    ontab: (){
                                      Get.toNamed(Routes.veriPage);
                                      },

                                    childtext: const Text('التالي'),
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
                                  TextButton(
                                    onPressed: (){
                                      Get.toNamed(Routes.loginPage);
                                    },
                                    child: const Text(
                                      'تسجيل الدخول بالبريد الإلكتروني',
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
            ],
            ),
          ),
        ),
      ),
    );
  }
}