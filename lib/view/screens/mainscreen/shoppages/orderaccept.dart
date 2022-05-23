import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/navcontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

class OrderAccept extends StatelessWidget {
  OrderAccept({ Key? key }) : super(key: key);
  final navController = Get.find<NavController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GetBuilder<NavController>(
                  builder: (_){
                    return IconButton(
                  onPressed: (){
                    navController.changeShopPage(1);
                  }, 
                  icon: const Icon(Icons.arrow_back),
                  );
                  }
                  ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('الدفع',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 15,)
                    ],
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    
                    Positioned(
                      right: 50,
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/credit.png'),
                            ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 55,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/check.png'),
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Text('تم قبول الطلب',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
                ),
              ),

            const Text('تم تسجيل طلبك بنجاح , يمكنك زيارة تتبع الطلبات للتحقق من عملية التسليم',
                maxLines: 2,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),

            const SizedBox(height: 40,),
            
            GetBuilder<NavController>(
            builder: (_){
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: buttomUtils(
                    ontab: (){  
                      navController.changeShopPage(4);
                      },
                    childtext: const Text('تتبع الطلب'),
                    maincolor: mainColor,
                    radius: 25, 
                    leftpadding: 0, 
                    rightpadding: 0, 
                    toppadding: 8, 
                    buttompadding: 8,
                    c: mainColor,
                  ),
            ),
          );
          }
          )
          ],
        ),
      ),
    );
  }
}