import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselController carouselController=CarouselController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Transform(
            transform:  Matrix4.translationValues(-40.0, 0.0, 0.0),
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
          actions: const [
            Icon(Icons.search,size: 25,color:blackColor,),
            SizedBox(width: 10,),
            Icon(Icons.menu,size: 25,color:blackColor,),
          ],  
          elevation: 1,
        ),
        body: Column(
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
                        setState(() {
                          currentPage=index;
                        });
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
                    child: AnimatedSmoothIndicator(
                      activeIndex: currentPage, 
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
            )
          ],
        ),
      ),
    );
  }
}