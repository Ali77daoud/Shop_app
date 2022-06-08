import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductDetails({ Key? key }) : super(key: key);
  final pagesController = Get.find<PagesController>();
  CarouselController carouselController=CarouselController();
  

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  GetBuilder<PagesController>(
      builder: (_){
      return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: h*0.35,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: 3, 
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlayInterval: const Duration(seconds: 2),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        pagesController.carouselChange2(index);
                      },
                    ),
                    itemBuilder: (context, index, realIndex){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                            image: AssetImage(pagesController.photoMap[pagesController.mainCategoryId][pagesController.clothesIndex][pagesController.productDetailsIndex],),
                            fit: BoxFit.contain
                            ),
                        ),
                      );
                    }, 
                    ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed:(){
                        Get.back();
                      },
                      icon: Container(
                        width: 30,
                        height: 30,
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color: blackColor,
                        ),
                        child: const Center(child: Icon(Icons.arrow_back,color: whiteColor,))) 
                      ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: AnimatedSmoothIndicator(
                          activeIndex: pagesController.currentPage2, 
                          count: 3,
                          effect: SlideEffect(
                              dotColor: whiteColor,
                              activeDotColor: blackColor,
                              dotHeight: 5,
                              dotWidth: w*0.3,
                              spacing: 0, 
                              paintStyle: PaintingStyle.fill,
                              radius: 2,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(pagesController.clothesMap[pagesController.mainCategoryId][pagesController.clothesIndex][pagesController.productDetailsIndex],
                            maxLines: 2,
                            style: const TextStyle(
                                color: blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Text(pagesController.price1Map[pagesController.mainCategoryId][pagesController.clothesIndex][pagesController.productDetailsIndex]+' \$',
                                maxLines: 2,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                  ),
                              ),
                              const SizedBox(width: 20,),
                              Text(pagesController.price2Map[pagesController.mainCategoryId][pagesController.clothesIndex][pagesController.productDetailsIndex]+' \$',
                                maxLines: 2,
                                style: const TextStyle(
                                    color: greyColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ////////////////////
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: mainColor
                        ),
                        child: IconButton(
                          onPressed: (){
          
                          }, 
                          icon: const Icon(
                            Icons.shopping_cart_sharp,
                            color: whiteColor,
                            size: 20,
                            )
                          ),
                      ),

                    ],
                  ),
                ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('اللون',
                      maxLines: 2,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                const SizedBox(height: 10,),
                SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return InkWell(
                            splashColor: whiteColor,
                            onTap: (){
                              pagesController.changeColor(index);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pagesController.selectedColor == index?
                                      greyColor:lightGreyColor1
                                ),
                              ),
                              Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                  color:  pagesController.colorList[index],
                                ),
                            
                                ),
                              ],
                            ),
                          );
                    }, 
                    separatorBuilder: (context,index){
                      return const SizedBox(width: 10,);
                    }, 
                    itemCount: pagesController.colorList.length
                    ),
                  ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Text('المقاس',
                      maxLines: 2,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                const SizedBox(height: 10,),
                SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return InkWell(
                            splashColor: whiteColor,
                            onTap: (){
                              pagesController.changeSize(index);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: pagesController.selectedSize == index?
                                      greyColor:lightGreyColor1
                                ),
                              ),
                              Text(
                                 pagesController.sizeList[index],
                                style: const TextStyle(
                                color: blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              ],
                            ),
                          );
                    }, 
                    separatorBuilder: (context,index){
                      return const SizedBox(width: 10,);
                    }, 
                    itemCount:  pagesController.sizeList.length
                    ),
                  ),
             ],
           ),
         ),
          ],
      ),
    );
    });
    
     
  }
}