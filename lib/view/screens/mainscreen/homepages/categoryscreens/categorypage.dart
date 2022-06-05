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
                          width: 100,
                          height:30,
                          child: InkWell(
                            onTap: (){
                              pagesController.changeCategoryColor(index);
                              pagesController.clothesIndex = index;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(pagesController.categoryList[pagesController.gender][index],
                                  style: TextStyle(
                                  color: pagesController.selectedIndex == index?
                                          blackColor:greyColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Text('('+
                                pagesController.clothesMap[pagesController.gender][index].length.toString()
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
                      return const SizedBox(width: 6,);
                    },
                    itemCount: pagesController.categoryList[pagesController.gender].length,
                    ),
                ),
              ),
              ///////////////////////////
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 9.0,
                      crossAxisSpacing: 6.0,
                      maxCrossAxisExtent: 250,
                    ), 
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Get.toNamed(Routes.productScreen);
                      pagesController.productDetailsIndex = index;
                      pagesController.currentPage2 = 0;
                    },
                    child: homeCard(
                      hight: 150,
                      width: double.infinity,
                      widthBetweenPrice: 0,
                      elevation: 5,
                      color: whiteColor, 
                      radius: 10, 
                      centertext:pagesController.clothesMap[pagesController.gender][pagesController.clothesIndex][index],
                      img: pagesController.photoMap[pagesController.gender][pagesController.clothesIndex][index],
                      price1:pagesController.price1Map[pagesController.gender][pagesController.clothesIndex][index],
                      price2: pagesController.price2Map[pagesController.gender][pagesController.clothesIndex][index],
                      ),
                  );
                },
                itemCount: pagesController.clothesMap[pagesController.gender][pagesController.clothesIndex].length,
              ),
            ],
          ),
        ),
    );
    });
      
  }
}