import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/boarding_model.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/boarding_items.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boarderController= PageController();

  List <OnBoardingModel> boardingItems=[
    OnBoardingModel(
      //
      image: 'assets/images/1.jpg',body: 'مرحباً بك',title: 'متجر إلكتروني',buttonName: 'التالي'
    ),
    OnBoardingModel(
        image: 'assets/images/2.jpg',body: '',title: 'متجر إلكتروني',buttonName: 'التالي'
    ),
    OnBoardingModel(
        image: 'assets/images/3.jpg',body:  ' ',title: 'متجر إلكتروني',buttonName: 'فلنبدأ'
    ),
  ];

  bool isLast = false;


  void skipBoarding(){
    Get.offNamed(Routes.choosePage);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: h*0.8,
                      width: double.infinity,
                      child: PageView.builder(
                        onPageChanged: (index){
                          if(index == boardingItems.length-1){
                            setState(() {
                              isLast=true;
                            });
                    
                          }else{
                            setState(() {
                              isLast=false;
                            });
                    
                          }
                        },
                        physics: const BouncingScrollPhysics(),
                        controller: boarderController,
                        itemBuilder: (context, index) => boarderItems(
                          boardingItems[index],
                          context,
                          boarderController,
                          boardingItems.length,
                          (){
                              if(isLast){
                                skipBoarding();
                              }else{
                                boarderController.nextPage(duration:Duration(milliseconds: 700) , curve: Curves.fastLinearToSlowEaseIn);
                              }
                          }                        
                          ),
                        itemCount: boardingItems.length,
                      ),
                    ),
                  const SizedBox(height: 20,),
                  const Text('ابحث عن المنتجات بسهولة و بأسعار جيدة',
                        style: TextStyle(
                          fontSize: 18,
                          color: greyColor
                        ),
                      )
                  ],
                ),
              ),
            )),
      ),
    );
  }



}
