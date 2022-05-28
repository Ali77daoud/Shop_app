import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';
import 'package:shop_app/view/widget/cartwidget.dart';

class Shop extends StatelessWidget {
  Shop({ Key? key }) : super(key: key);
  final pagesController = Get.find<PagesController>();

  final TextEditingController code = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('عربة تسوق',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: double.infinity,
                height: 235,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return CartWidget();
                  },
                  separatorBuilder:(context,index){
                    return const SizedBox(
                      height: 15,
                    );
                  }, 
                  itemCount: 2,
                  ),
              ),
            ),
            const Text('المجموع',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('المجموع الفرعي',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),
              Text('33.33 \$',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('الشحن',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),
              Text('0 \$',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              ],
            ),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: TextFormField(
                keyboardType:TextInputType.text,
                controller: code,
                cursorColor: mainColor,
                decoration: InputDecoration(
                  suffix:InkWell(
                    onTap: (){

                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text('تطبيق',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ), 
                  labelText: 'أدخل رمز القسيمة',
                  contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                  labelStyle: const TextStyle(
                    fontSize: 15,
                    color: greyColor
                  ),
                  filled: false,
                  enabledBorder: OutlineInputBorder(      
                  borderSide: BorderSide(color: lightGreyColor2),
                  borderRadius: BorderRadius.circular(20)  
                ),  
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: lightGreyColor2),
                  borderRadius: BorderRadius.circular(20) 
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: lightGreyColor2),
                  borderRadius: BorderRadius.circular(20) 
                ),
                ),
              ),
          ),
          const SizedBox(width: 20,),
          Center(
            child: buttomUtils(
              ontab: (){
                pagesController.changeShopPage(1);
              }, 
              childtext: const Text('الدفع',
                        style: TextStyle(
                          fontSize: 15,
                          color: whiteColor,
                          fontWeight: FontWeight.bold
                        ),
                      ), 
              maincolor: mainColor, 
              radius: 20, 
              leftpadding: 45, 
              rightpadding:45, 
              toppadding: 5, 
              buttompadding: 5,
              c: mainColor
              ),
          )
          ],
        ),
      ),
    );
  }
}