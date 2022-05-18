import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/mainscreen_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/gridviewcard.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({ Key? key }) : super(key: key);
  final mainController = Get.put(MainController());
  List<String> categoryList=[
    'قمصان',
    'فساتين',
    'احذية',
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          title: Transform(
            transform:  Matrix4.translationValues(5.0, 0.0, 0.0),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.shopping_cart_rounded,size: 35,color:mainColor,),
                        SizedBox(width: 10,),
                        Text('Outletship',
                          style: TextStyle(
                            color: blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        )
                       
                    ],
                  ),
          ),

          centerTitle: false,
          titleSpacing: 0.0, 
          actions:  [
            IconButton(
              onPressed:(){} ,
              icon: const Icon( Icons.search,size: 25,color:blackColor,),
              ),
            const SizedBox(width: 5,),
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.menu,size: 25,color:blackColor,),
            ),
          ],  
          elevation: 1,
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('الجديد في',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Icon(Icons.menu)
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
                        return GetBuilder<MainController>(
                          builder:(_){
                            return SizedBox(
                            width: 100,
                            height:30,
                            child: InkWell(
                              onTap: (){
                                mainController.changeColor(index);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(categoryList[index],
                                    style: TextStyle(
                                    color: mainController.selectedIndex == index?
                                            blackColor:greyColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Text('(12)',
                                    style: TextStyle(
                                    color: mainController.selectedIndex == index?
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
              SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }
}