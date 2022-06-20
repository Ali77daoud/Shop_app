import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/pagescontroller.dart';
import 'package:shop_app/utils/theme.dart';

// ignore: must_be_immutable
class CustomButtomNavBar extends StatelessWidget {

  var ontap;
  double iconSize;
  Color fixedColor;
  Color unselectedColor;
  int index ;

  CustomButtomNavBar({ 
    Key? key,
    required this.ontap,
    required this.iconSize,
    required this.fixedColor,
    required this.unselectedColor,
    this.index = 0,  
   }) : super(key: key);

  final pagesController = Get.put(PagesController());
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
              const BottomNavigationBarItem(icon:Icon(Icons.home),label: '' ),
              BottomNavigationBarItem(
                icon:Badge(
                  badgeColor: mainColor,
                  padding: const EdgeInsets.all(4),
                  badgeContent: Text(
                    pagesController.cartProductNumber.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      color: whiteColor
                    ),
                    ),
                  child: const Icon(Icons.shopping_cart_sharp)),
                  label: ''
                   ),
              const BottomNavigationBarItem(icon:Icon(Icons.assignment_returned),label: '' ),
              const BottomNavigationBarItem(icon:Icon(Icons.person_pin),label: '' ),
            ],
        iconSize: iconSize,
        currentIndex: index,
        onTap: ontap ,
        type: BottomNavigationBarType.fixed,
        fixedColor: fixedColor,
        unselectedItemColor: unselectedColor,
      ) ;
  }
}

