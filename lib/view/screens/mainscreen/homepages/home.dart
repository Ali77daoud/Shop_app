import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/navcontroller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/icon_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);

  final navController = Get.find<NavController>();
  CarouselController carouselController=CarouselController();
  
  List<String> imageList = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h*0.35,
              child: Stack(
                children: [
                  GetBuilder<NavController>(
                    builder: (_){
                      return CarouselSlider.builder(
                    itemCount: 3, 
                    carouselController: carouselController,
                    options: CarouselOptions(
                      initialPage: navController.currentPage1 ,
                      height: 400,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        navController.carouselChange1(index);
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
                    );
                    }
                    ),
                  
                  Positioned(
                    top: 20,
                    left: 20,
                    child: 
                      AnimatedSmoothIndicator(
                          activeIndex:navController.currentPage1, 
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
            ),
            SizedBox(height: h*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      navController.changePage(1);
                    },
                    child: iconContainer(
                      icon: Image.asset('assets/images/shopping-bags.png'),
                      text: 'الجديد في',
                      color: mainColor,
                      h: 5,
                      ),
                  ),
                   iconContainer(
                    icon: Image.asset('assets/images/tshirt.png'),
                    text: 'قمصان',
                    color: blackColor,
                    h: 5,
                    ),iconContainer(
                    icon: Image.asset('assets/images/dress.png'),
                    text: 'فساتين',
                    color: blackColor,
                    h: 5,
                    ),
                 
                  iconContainer(
                    icon: Image.asset('assets/images/high-heel.png'),
                    text: 'أحذية',
                    color: blackColor,
                    h: 5,
                    ),
                  
                  iconContainer(
                    icon: Image.asset('assets/images/jeans.png'),
                    text: 'جينز',
                    color: blackColor,
                    h: 5,
                    ),
                ],
              ),
            ),
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
            const Text('لماذا يجب عليك اختيارنا؟',
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
                    child: iconContainer(
                    icon: Image.asset('assets/images/money.png'),
                    text: 'ضمان استعادة الأموال',
                    color: blackColor,
                    h: 20,
                    ),
                  ),
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
                    child: iconContainer(
                    icon: Image.asset('assets/images/cargo-truck.png'),
                    text: 'الشحن مجاناً',
                    color: blackColor,
                    h: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}