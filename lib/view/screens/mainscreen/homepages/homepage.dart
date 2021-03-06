import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/gridviewcard.dart';
import 'package:shop_app/view/widget/icon_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final pagesController = Get.put(PagesController());
  final authController = Get.find<AuthController>();
  
  CarouselController carouselController=CarouselController();
  CarouselController carouselController2=CarouselController();
  final keyrefresh = GlobalKey<RefreshIndicatorState>();
  
  List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    String? token = authController.token.read<String>('t');

    return pagesController.isLoadingCategory?
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(child: CircularProgressIndicator(color: mainColor,)),
            ],
          ),
    ):
     RefreshIndicator(
      key: keyrefresh,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      color: mainColor,
      onRefresh: ()async{
        pagesController.isLoadingCategory = true;
        await pagesController.getCategories(token:token.toString()).then((value)async{
          await pagesController.getLast10Products(token: token.toString()).then((value)async{
            await pagesController.getSubCategories();
          });
        });
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              ///////////////////////////////////////////////////////////////////////////////////////1
              GetBuilder<PagesController>(
                builder: (_){
                  return SizedBox(
                    height: h*0.35,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: 3, 
                          carouselController: carouselController,
                          options: CarouselOptions(
                            initialPage: pagesController.currentPage1 ,
                            height: 400,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              pagesController.carouselChange1(index);
                            },
                          ),
                          itemBuilder: (context, index, realIndex){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/1.jpg'),
                                  fit: BoxFit.cover
                                  ),
                              ),
                            );
                          }, 
                          ),
                        
                        Positioned(
                          top: 20,
                          left: 20,
                          child: 
                            AnimatedSmoothIndicator(
                                activeIndex:pagesController.currentPage1, 
                                count: 3,
                                effect:  const SlideEffect(
                                    dotColor: whiteColor,
                                    activeDotColor: mainColor,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    spacing: 5, 
                                    paintStyle: PaintingStyle.stroke,
                                  ),
                            ),
                          
                          ),
                      ],
                    ),
                  );
                }
                ),
              /////////////////////////////////////////////////////////////////////////////////////2
              SizedBox(height: h*0.02,),
              GetBuilder<PagesController>(
                builder: (_){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          iconContainer(
                            image: 'assets/images/shopping-bags.png',
                            text: '???????????? ????',
                            color: mainColor,
                            h: 5,
                            ifNetwork: false,
                            ),
                          const SizedBox(width:20,),
                          Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return Obx(
                                  (){
                                    return  InkWell(
                                      onTap: (){
                                        pagesController.changeCategoryColor(0);
                                        pagesController.clothesIndex = 0;
                                        pagesController.dataBarnchesList.clear();
                                        pagesController.dataproductsList.clear();
                                        pagesController.dataBrandsList.clear();
                                        pagesController.subCategoryId = pagesController.dataSubCategoryList.
                                        where((e) => e.mcategoryId==pagesController.mainCategoryId).toList()[index].id!.toInt();
                                        print(pagesController.subCategoryId);
                                        pagesController.isLoadingproducts = true;
                                        Get.toNamed(Routes.categoryScreen);
                                        pagesController.getBarnches().then((value){
                                          pagesController.getBrands().then((value){
                                            print(pagesController.dataBrandsList[0].brandName.toString());
                                            pagesController.getProduct().then((value){
                                              pagesController.barnchesId = pagesController.dataBarnchesList.
                                                where((e) =>e.subcategoryId == pagesController.subCategoryId).toList()[index].id!.toInt();
                                                print('barnchesId = ''${pagesController.barnchesId}');
                                          });
                                          });
                                        });
                                      },
                                      child: iconContainer(
                                        image: pagesController.dataSubCategoryList.
                                        where((e) => e.mcategoryId==pagesController.mainCategoryId).toList()[index].photoName.toString(),
                                        text: pagesController.dataSubCategoryList.
                                        where((e) => e.mcategoryId==pagesController.mainCategoryId).
                                        toList()[index].translations!.firstWhere((e) => e.locale=='ar').subcategoryName.toString(),
                                        color: blackColor,
                                        h: 5,
                                        ifNetwork: true
                                        ),
                                    );
                                  }
                                  );
                              },
                              separatorBuilder: (context,index){
                                return const SizedBox(width: 15,);
                              },
                              itemCount:pagesController.dataSubCategoryList.
                                        where((e) => e.mcategoryId==pagesController.mainCategoryId).toList().length,
                              ),
                          ),
                        ],
                      ),
                    ),
                  );
              }),
              ///////////////////////////////////////////////////////////////////////////////3
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height:150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(imageList[index]),
                              fit: BoxFit.cover,
                              )
                          ),
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(width: 10,);
                      },
                      itemCount: imageList.length,
                      ),
                  ),
              ),
              /////////////////////////////////////////////////////////////////////////////////4
              const Text('?????????? ?????? ???????? ??????????????????',
                    style: TextStyle(
                      color: greyColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 130,
                      height: 150,
                      padding: const EdgeInsets.only(top:20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                           BoxShadow(
                          color: greyColor,
                          offset: Offset(
                            0,
                            0,
                          ),
                          blurRadius: 7.0,
                          spreadRadius: 1.0,
                        )
                        ]
                          ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: iconContainer(
                        image: 'assets/images/money.png',
                        text: '???????? ?????????????? ??????????????',
                        color: blackColor,
                        h: 20,
                        ifNetwork: false,
                        ),
                      ),
                    ),
                    ////////////////////
                    Container(
                      width: 130,
                      height: 150,
                      padding: const EdgeInsets.only(top:20),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [
                           BoxShadow(
                          color: greyColor,
                          offset: Offset(
                            0,
                            0,
                          ),
                          blurRadius: 7.0,
                          spreadRadius: 1.0,
                        )
                        ]
                          ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 15),
                        child: iconContainer(
                        image: 'assets/images/cargo-truck.png',
                        text: '?????????? ????????????',
                        color: blackColor,
                        h: 20,
                        ifNetwork: false
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////////5
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetBuilder<PagesController>(
                    builder: (_){
                      return Column(
                        children: [
                          CarouselSlider.builder(
                              itemCount: 3, 
                              carouselController: carouselController2,
                              options: CarouselOptions(
                                initialPage: pagesController.currentPage1 ,
                                height: 150,
                                autoPlay: true,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlayInterval: const Duration(seconds: 3),
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  pagesController.carouselChange3(index);
                                },
                              ),
                              itemBuilder: (context, index, realIndex){
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/2.jpg'),
                                      fit: BoxFit.cover
                                      ),
                                  ),
                                );
                              }, 
                          ),
                          const SizedBox(height: 15,),
                          AnimatedSmoothIndicator(
                              activeIndex:pagesController.currentPage3, 
                              count: 3,
                              effect: const ExpandingDotsEffect(
                                expansionFactor: 3,
                                dotColor: greyColor,
                                activeDotColor: darkBlueColor,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  spacing: 5, 
                                  paintStyle: PaintingStyle.fill,
                              )  
                        ),
                        ],
                      );
                    }
                ),
              ),
              ////////////////////////////////////////////////////////////////////////////////////////6
             const Text('???????????? ?????? ??????????',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
              GetBuilder<PagesController>(builder: (_){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: SizedBox(
                      width: double.infinity,
                      height: 217,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              homeCard(
                              ifNetworkImage: true,
                              hight: 150,
                              width: 150,
                              widthBetweenPrice: 25,
                              elevation: 5,
                              color: whiteColor, 
                              radius: 10, 
                              centertext: 
                              pagesController.dataLast10productsList![index].translations!.isEmpty?
                              '':
                              pagesController.dataLast10productsList![index].translations!.
                              firstWhere((element) => element.locale == 'ar').productName.toString(), 
                              img: pagesController.dataLast10productsList![index].images!.isEmpty?
                                    'images/The_Product/1e3572313d21c2bf591caa7d263d2f33.png':
                                    pagesController.dataLast10productsList![index].images![0].imageName.toString(), 
                              
    
                              price1: pagesController.dataLast10productsList![index].minPrice.toString(),
    
                              price2: pagesController.dataLast10productsList![index].maxPrice.toString(),
                              ),
                              Positioned(
                                top: 10,
                                right: 15,
                                child: Container(
                                  height: 25,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: const Center(
                                    child: Text('30%',
                                      style: TextStyle(
                                        color: whiteColor
                                      ),
                                    )
                                    ),
                                  ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(width: 10,);
                        },
                        itemCount: pagesController.dataLast10productsList!.length,
                        ),
                    ),
                );
              })
              
            ],
          ),
        ),
    );
  }
}