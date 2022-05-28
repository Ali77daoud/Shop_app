import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/orderaccept.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/oredertracking.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/payment1.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/payment2.dart';
import 'package:shop_app/view/screens/mainscreen/shoppages/shop.dart';

class ShopPage extends StatelessWidget {
  ShopPage({ Key? key }) : super(key: key);
  final pagesController = Get.find<PagesController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesController>(
      builder: (_){
        return 
        IndexedStack(
          index: pagesController.shopPageIndex,
          children: [
            Shop(),
            FirstPayment(),
            SecondPayment(),
            OrderAccept(),
            OrederTracking(),
          ],
        );  
      }
      );
  }
}