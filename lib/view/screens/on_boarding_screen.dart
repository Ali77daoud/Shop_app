import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/boarding_model.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/boarding_items.dart';
import 'package:shop_app/view/widget/button_utils.dart';


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
      image: 'assets/images/1.jpg',body: 'مرحباً بك',title: 'متجر إلكتروني',buttonName: 'فلنبدأ'
    ),
    OnBoardingModel(
        image: 'assets/images/2.jpg',body: 'مرحباً بك',title: 'متجر إلكتروني',buttonName: 'فلنبدأ'
    ),
    OnBoardingModel(
        image: 'assets/images/3.jpg',body:  'مرحباً بك',title: 'متجر إلكتروني',buttonName: 'فلنبدأ'
    ),
  ];

  bool isLast = false;


  void skipBoarding(){
    Get.offNamed(Routes.loginPage);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor:whiteColor ,
          body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: h*0.8,
                    width: double.infinity,
                    child: Stack(
                      children: [
                      PageView.builder(
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
                          ),
                        itemCount: boardingItems.length,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3),
                            child: buttomUtils(
                              ontab:(){
                                    skipBoarding();
                                  }  ,
                              childtext: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  const [
                                  Text('فلنبدأ',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                  Icon(Icons.arrow_forward),
                                ],
                              ), 
                              maincolor: mainColor, 
                              radius: 20, 
                              leftpadding: 0, 
                              rightpadding:0, 
                              toppadding: 10, 
                              buttompadding: 10,
                              c: mainColor
                              ),
                              ),
                      ),
                      ],
                      
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical:30),
                    child: Text('ابحث عن المنتجات بسهولة و بأسعار جيدة',
                        style: TextStyle(
                          fontSize: 20,
                          color: greyColor,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                  ),
                ],
              ),
            )),
      ),
    );
  }



}
