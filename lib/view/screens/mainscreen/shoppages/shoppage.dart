import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';
import 'package:shop_app/view/widget/cartwidget.dart';

class ShopPage extends StatelessWidget {
  ShopPage({ Key? key }) : super(key: key);

  final pagesController = Get.find<PagesController>();
  final authController = Get.put(AuthController());

  final TextEditingController codekey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int? userId = authController.userId.read<int>('id');
    String? token = authController.token.read<String>('t');
    return
    GetBuilder<PagesController>(
      builder: (_){
        return pagesController.isGetCartData?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: CircularProgressIndicator(color: mainColor,)),
          ],
        ):
         SingleChildScrollView(
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
                  // physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemBuilder: (context,index){
                    return cartWidget(
                      productName: pagesController.cartData!.Product_detailss![index].product_Info!.translations!.
                      firstWhere((e) => e.locale=='ar').product_name.toString(),

                      productDescription: pagesController.cartData!.Product_detailss![index].product_Info!.translations!.
                      firstWhere((e) => e.locale=='ar').description.toString(),

                      totalPrice: pagesController.cartData!.Product_detailss![index].total_price.toString(),

                      productQuantity: pagesController.cartData!.Product_detailss![index].product_quantity.toString(),

                      onIncrease: (){
                        int productCount = int.parse(pagesController.cartData!.
                        Product_detailss![index].product_quantity.toString());
                        if(productCount < 5){
                          productCount++;
                        }
                        print(productCount);

                        authController.showCircleDialog(context: context);

                        pagesController.updateCart(
                          userId: userId!.toInt(), 
                          productId: pagesController.cartData!.Product_detailss![index].product_Info!.id!.toInt(), 
                          quantity: productCount, 
                          price: int.parse(pagesController.cartData!.
                          Product_detailss![index].price.toString()), 
                          token: token.toString()
                          ).then((value){
                            pagesController.getFromCart(
                              userId: userId,
                              token: token.toString()
                              ).then((value) => Get.back(closeOverlays: true));
                          });
                      },

                      ondecrease: (){
                        int productCount = int.parse(pagesController.cartData!.
                        Product_detailss![index].product_quantity.toString());
                        if(productCount > 1){
                          productCount--;
                        }
                        print(productCount);

                        authController.showCircleDialog(context: context);

                        pagesController.updateCart(
                          userId: userId!.toInt(), 
                          productId: pagesController.cartData!.Product_detailss![index].product_Info!.id!.toInt(), 
                          quantity: productCount, 
                          price: int.parse(pagesController.cartData!.
                          Product_detailss![index].price.toString()), 
                          token: token.toString()
                          ).then((value){
                            pagesController.getFromCart(
                              userId: userId,
                              token: token.toString()
                              ).then((value) => Get.back(closeOverlays: true));
                          });
                      },

                      onDelete: (){
                        authController.showCircleDialog(context: context);
                        pagesController.removefromCart(
                          userId: userId!.toInt(),
                          productId: pagesController.cartData!.Product_detailss![index].product_Info!.id!.toInt(), 
                          token: token.toString(),
                          ).then((value){
                            pagesController.getFromCart(
                              userId: userId,
                              token: token.toString()
                              ).then((value) => Get.back(closeOverlays: true));
                          });
                      }
                    );
                  },
                  separatorBuilder:(context,index){
                    return const SizedBox(
                      height: 15,
                    );
                  }, 
                  itemCount: pagesController.cartData!.Product_detailss!.length.toInt(),
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
              children: [
                const Text('المجموع الفرعي',
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
                  ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    width: 180,
                    child: Text('${pagesController.priceForAllProduct.toString()} \$',
                      maxLines: 2,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: SizedBox(
                    width: 180,
                    child: Text('0 \$',
                      maxLines: 2,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: TextFormField(
                keyboardType:TextInputType.text,
                controller: codekey,
                cursorColor: mainColor,
                decoration: InputDecoration(
                  suffix:InkWell(
                    onTap: (){
                     authController.showCircleDialog(context: context);
                     pagesController.couponCart(
                      code: codekey.text ,
                      totalPrice: pagesController.priceForAllProduct!, 
                      token: token.toString(),
                      ).then((value){
                        FocusManager.instance.primaryFocus?.unfocus();
                        print(pagesController.couponCartData!.data!);
                      });
                      
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
                Get.toNamed(Routes.payment1Screen);
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
    );
    
  }
}