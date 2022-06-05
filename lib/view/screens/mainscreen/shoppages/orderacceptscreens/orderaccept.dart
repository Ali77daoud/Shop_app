import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';

class OrderAccept extends StatelessWidget {
  OrderAccept({ Key? key }) : super(key: key);
  final pagesController = Get.find<PagesController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                        width: 200,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/accept.jpg'),
                            fit: BoxFit.contain
                            ),
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

            const SizedBox(height: 60,),
            
            GetBuilder<PagesController>(
            builder: (_){
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: buttomUtils(
                    ontab: (){  
                      Get.toNamed(Routes.orderTrackingScreen);
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