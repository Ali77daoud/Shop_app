import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/mainscreen_controller.dart';
import 'package:shop_app/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({ Key? key }) : super(key: key);
  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        child:
        GetBuilder<MainController>(
          builder: (_){
            return
            Scaffold(
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
            bottomNavigationBar:
            Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                      items: const [
                            BottomNavigationBarItem(icon:Icon(Icons.home),label: '' ),
                            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_sharp),label: '' ),
                            BottomNavigationBarItem(icon:Icon(Icons.assignment_returned),label: '' ),
                            BottomNavigationBarItem(icon:Icon(Icons.person_pin),label: '' ),
                          ],
                      iconSize: 23,
                      currentIndex: mainController.i,
                      onTap: (index){
                        mainController.changeScreen(index);
                      },
                      type: BottomNavigationBarType.shifting,
                      fixedColor: Get.isDarkMode?blackColor:mainColor,
                      unselectedItemColor: Colors.grey,
            
                    ),
            ) ,
            body: mainController.screens[mainController.i],
        
      );
      }
      )
      ),
    );
  }
}