import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

class SecondPayment extends StatelessWidget {
  SecondPayment({ Key? key }) : super(key: key);
  
  final pagesController = Get.find<PagesController>();
  final TextEditingController street1 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 20,),
                      Text('الدفع',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Get.back();
                  }, 
                  icon: const Icon(Icons.arrow_forward),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: mainColor
                              ),
                          ),
                        ),
                       const Icon(Icons.shopping_cart_outlined,color: mainColor,)
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                          height: 2,
                          color: greyColor,
                        ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: mainColor
                              ),
                          ),
                        ),
                       const Icon(Icons.car_repair,color: mainColor,)
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                          height: 2,
                          width: 50,
                          color: greyColor,
                        ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: mainColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: mainColor
                              ),
                          ),
                        ),
                       const Icon(Icons.credit_card_outlined,color: whiteColor,size: 18,)
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                  keyboardType:TextInputType.text,
                  controller: street1,
                  cursorColor: mainColor,
                  validator: (value){
                      if(value!.isEmpty){
                      return 'أدخل رمز البريد  من فضلك';
                    }
                    },
                  decoration: InputDecoration(
                    labelText: 'الاسم على البطاقة',
                    contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: mainColor
                    ),
                    filled: false,
                    enabledBorder: OutlineInputBorder(      
                    borderSide: BorderSide(color: lightGreyColor2),   
                  ),  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreyColor2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreyColor2),
                  ),
                  ),
                ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                  keyboardType:TextInputType.text,
                  controller: city,
                  cursorColor: mainColor,
                  validator: (value){
                      if(value!.isEmpty){
                      return 'أدخل رمز البريد  من فضلك';
                    }
                    },
                  decoration: InputDecoration(
                    labelText: 'رقم البطاقة',
                    contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: mainColor
                    ),
                    filled: false,
                    enabledBorder: OutlineInputBorder(      
                    borderSide: BorderSide(color: lightGreyColor2),   
                  ),  
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreyColor2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreyColor2),
                  ),
                  ),
                ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: TextFormField(
                          keyboardType:TextInputType.text,
                          controller: state,
                          cursorColor: mainColor,
                          validator: (value){
                              if(value!.isEmpty){
                              return 'أدخل رمز البريد  من فضلك';
                            }
                            },
                          decoration: InputDecoration(
                            labelText: 'تاريخ انتهاء الصلاحية',
                            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              color: mainColor
                            ),
                            filled: false,
                            enabledBorder: OutlineInputBorder(      
                            borderSide: BorderSide(color: lightGreyColor2),   
                          ),  
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGreyColor2),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGreyColor2),
                          ),
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: SizedBox(
                      child: TextFormField(
                          keyboardType:TextInputType.text,
                          controller: country,
                          cursorColor: mainColor,
                          validator: (value){
                              if(value!.isEmpty){
                              return 'أدخل رمز البريد  من فضلك';
                            }
                            },
                          decoration: InputDecoration(
                           labelText:'يرجى إدخال ال ' + 'CVV',
                            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                            labelStyle: const TextStyle(
                              fontSize: 14,
                              color: mainColor
                            ),
                            filled: false,
                            enabledBorder: OutlineInputBorder(      
                            borderSide: BorderSide(color: lightGreyColor2),   
                          ),  
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGreyColor2),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: lightGreyColor2),
                          ),
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: Row(
                children: const [
                  Icon(Icons.check_circle,color: mainColor,size: 30,),
                  SizedBox(width: 20,),
                  Text('حفظ تفاصيل هذه البطاقة',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buttomUtils(
                  ontab: (){
                    Get.toNamed(Routes.orderAcceptScreen);
                  }, 
                  childtext: const Text('التالي',
                            style: TextStyle(
                              fontSize: 18,
                              color: whiteColor,
                              fontWeight: FontWeight.bold
                            ),
                          ), 
                  maincolor: mainColor, 
                  radius: 20, 
                  leftpadding: 35, 
                  rightpadding:35, 
                  toppadding: 5, 
                  buttompadding: 5,
                  c: mainColor
                  ),
                   
                buttomUtils(
                ontab: (){
                  Get.back();
                }, 
                childtext: const Text('الرجوع',
                          style: TextStyle(
                            fontSize: 18,
                            color: blackColor,
                            fontWeight: FontWeight.bold
                          ),
                        ), 
                maincolor: whiteColor, 
                radius: 20, 
                leftpadding: 35, 
                rightpadding:35, 
                toppadding: 5, 
                buttompadding: 5,
                c: mainColor
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}