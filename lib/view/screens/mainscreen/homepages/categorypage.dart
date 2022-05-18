import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/navcontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/gridviewcard.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({ Key? key }) : super(key: key);

  final navController = Get.find<NavController>();
  List<String> categoryList=[
    'قمصان',
    'فساتين',
    'احذية',
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
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
                        navController.changePage(0);
                      }, 
                      icon: const Icon(Icons.arrow_forward_rounded)
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
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
              ),
              ////////////////////////
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 30,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GetBuilder<NavController>(
                          builder:(_){
                            return SizedBox(
                            width: 100,
                            height:30,
                            child: InkWell(
                              onTap: (){
                                navController.changeCategoryColor(index);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(categoryList[index],
                                    style: TextStyle(
                                    color: navController.selectedIndex == index?
                                            blackColor:greyColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Text('(12)',
                                    style: TextStyle(
                                    color: navController.selectedIndex == index?
                                            blackColor:greyColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                  )
                                ],
                              ),
                            ),
                          );
                          } 
                          );
                         
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(width: 6,);
                      },
                      itemCount: categoryList.length,
                      ),
                  ),
                ),
              ),
              ///////////////////////////
              InkWell(
                onTap: (){
                  navController.changePage(2);
                },
                child: SizedBox(
                  height: h*0.65 ,
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 9.0,
                          crossAxisSpacing: 6.0,
                          maxCrossAxisExtent: 250,
                        ), 
                    itemBuilder: (context,index){
                      return homeCard(
                        elevation: 5,
                        color: whiteColor, 
                        radius: 10, 
                        centertext:'قمصان', 
                        img: 'assets/images/1.jpg', 
                        price1: 30,
                        price2: 20,
                        );
                    },
                    itemCount: 4,
                    ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}