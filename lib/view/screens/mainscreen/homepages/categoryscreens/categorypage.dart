import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/mainscreen_controller.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/gridviewcard.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({ Key? key }) : super(key: key);

  final pagesController = Get.find<PagesController>();
  final mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PagesController>(builder: (_){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Text('الجديد في',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      Get.back();
                    }, 
                    icon: const Icon(Icons.arrow_forward_rounded)
                    ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 80,
                        height:30,
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                  },
                  separatorBuilder: (context,index){
                    return const SizedBox(width: 6,);
                  },
                  itemCount: 5,
                  ),
              ),
              ////////////////////////
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height:30,
                          child: InkWell(
                            onTap: (){
                              pagesController.changeCategoryColor(index);

                              pagesController.barnchesId = pagesController.dataBarnchesList.
                                where((e) =>e.subcategoryId == pagesController.subCategoryId).toList()[index].id!.toInt();
                              
                              print(pagesController.barnchesId);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(pagesController.dataBarnchesList.
                                where((e) =>e.subcategoryId == pagesController.subCategoryId).toList()[index].translations!.
                                firstWhere((e) => e.locale == 'ar').branchName.toString(),
                                  style: TextStyle(
                                  color: pagesController.selectedIndex == index?
                                          blackColor:greyColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Text('('+
                                '22'
                                +')'
                                ,
                                  style: TextStyle(
                                  color: pagesController.selectedIndex == index?
                                          blackColor:greyColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                )
                              ],
                            ),
                          ),
                        );
                    },
                    separatorBuilder: (context,index){
                      return const SizedBox(width: 15,);
                    },
                    itemCount: pagesController.dataBarnchesList.
                        where((e) =>e.subcategoryId == pagesController.subCategoryId).toList().length
                    ),
                ),
              ),
              ///////////////////////////
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.74,
                      mainAxisSpacing: 9.0,
                      crossAxisSpacing: 6.0,
                      maxCrossAxisExtent: 250,
                    ), 
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Get.toNamed(Routes.productScreen);
                      pagesController.productsId = pagesController.dataproductsList.where((e) => e.branchId == pagesController.barnchesId).
                      toList()[index].id!.toInt();
                      print('product id = ''${pagesController.productsId}');
                      // pagesController.productDetailsIndex = index;
                      // pagesController.currentPage2 = 0;
                    },
                    child: homeCard(
                      ifNetworkImage: true,
                      hight: 150,
                      width: double.infinity,
                      widthBetweenPrice: 0,
                      elevation: 5,
                      color: whiteColor, 
                      radius: 10, 
                      centertext: pagesController.dataproductsList.where((e) => e.branchId == pagesController.barnchesId).
                      toList()[index].translations!.firstWhere((e) => e.locale=='ar').productName.toString(),

                      img: pagesController.dataproductsList.where((e) => e.branchId == pagesController.barnchesId).
                      toList()[index].images![0].imageName.toString(),

                      price1: pagesController.dataproductsList.where((e) => e.branchId == pagesController.barnchesId).
                      toList()[index].minPrice.toString(),

                      price2: pagesController.dataproductsList.where((e) => e.branchId == pagesController.barnchesId).
                      toList()[index].maxPrice.toString(),
                      ),
                  );
                },
                itemCount: pagesController.dataproductsList.where((e) => e.branchId == pagesController.barnchesId).
                      toList().length,
              ),
            ],
          ),
        ),
    );
    });
      
  }
}