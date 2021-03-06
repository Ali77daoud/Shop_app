import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

// ignore: must_be_immutable
class FirstPayment extends StatelessWidget {
  TextEditingController street1;
  TextEditingController street2;
  TextEditingController city;
  TextEditingController state;
  TextEditingController country;
  GlobalKey formKey;

  FirstPayment({ Key? key,
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.country,
    required this.formKey,

   }) : super(key: key);
  
  final pagesController = Get.find<PagesController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              color: mainColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor
                                ),
                            ),
                          ),
                         const Icon(Icons.car_repair,color: whiteColor,)
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
                              color: whiteColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor
                                ),
                            ),
                          ),
                         const Icon(Icons.credit_card_outlined,color: mainColor,size: 18,)
                      ],
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
                    Text('عنوان الفواتير نفسه عنوان التسليم',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                  ],
                ),
              ),
              /////////////////////////////////////////////
              Form(
                key: formKey ,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                          keyboardType:TextInputType.text,
                          controller: street1,
                          cursorColor: mainColor,
                          decoration: InputDecoration(
                            labelText: 'شارع 1',
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
                          controller: street2,
                          cursorColor: mainColor,
                          decoration: InputDecoration(
                            labelText: 'شارع 2',
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
                          decoration: InputDecoration(
                            labelText: 'مدينة',
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
                                  decoration: InputDecoration(
                                    labelText: 'ولاية',
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
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                  keyboardType:TextInputType.text,
                                  controller: country,
                                  cursorColor: mainColor,
                                  decoration: InputDecoration(
                                    labelText: 'دولة',
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
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 80,),
          
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [ 
                        buttomUtils(
                          ontab: (){
                            print(street1.text);
                            Get.toNamed(Routes.payment2Screen);
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
              
            ],
          ),
        ),
      ),
    );
  }
}