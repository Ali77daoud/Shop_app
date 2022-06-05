import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController{
  int currentPage1 = 0;
  int currentPage2 = 0;
  int currentPage3 = 0; 
  int selectedIndex = 0;
  int selectedColor = 0;
  int selectedSize = 0;

  int productDetailsIndex = 0;

  int clothesIndex=0;
  int gender = 0;
  
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellowAccent,
    Colors.lightGreen,
    Colors.cyan,
    Colors.indigoAccent,
    Colors.lightGreenAccent,
    Colors.limeAccent,
    Colors.greenAccent,
    Colors.purple,
    Colors.green,
  ];

  List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  List<String> genderList = [
    'رجال',
    'نساء',
    'أطفال',
    'إكسسوارات',
    'إلكترونيات'
  ];

  List<List<String>> categoryList=[
    [
      'قمصان',
      'أحذية',
      'جينز'
    ],
    [
      'فساتين',
      'أحذية',
      'ساعات'
    ],
    [
      'ألعاب',
      'أحذية',
    ],
    [
      'خواتم',
      'أساور',
    ],
    [
      'برادات',
      'شاشات',
    ],
  ];

  List<List<String>> clotheIconList = [
    [
      'assets/images/tshirt.png',
      'assets/images/sneakers.png',
      'assets/images/jeans.png',
    ],
    [
      'assets/images/dress.png',
      'assets/images/high-heel.png',
      'assets/images/watch.png',
    ],
    [
      'assets/images/toys.png',
      'assets/images/baby-shoes.png',
    ],
    [
      'assets/images/ring.png',
      'assets/images/bracelet.png',
    ],
    [
      'assets/images/fridge.png',
      'assets/images/television.png',
    ],
  ];

  Map<int,dynamic> clothesMap = {
    0:[
       [
      'قميص1',
      'قميص2',
      'قميص3',
      ],
     [
      'حذاء1',
      'حذاء2',
     ],
     [
      'جينز1',
      'جينز2',
      'جينز3',
      'جينز4',
      'جينز5',
      ],
   ],

   1:[
       [
      'فستان1',
      'فستان2',
      'فستان3',
      ],
     [
      'حذاء1',
      'حذاء2',
     ],
     [
      'ساعة1',
      'ساعة2',
      'ساعة3',
      'ساعة4',
      'ساعة5',
      ],
   ],

   2:[
       [
      'لعبة1',
      'لعبة2',
      'لعبة3',
      'لعبة4',
      ],
     [
      'حذاء1',
      'حذاء2',
     ],
   ],
   3:[
       [
      'خاتم1',
      'خاتم2',
      'خاتم3',
      'خاتم4',
      ],
     [
      'إسوارة1',
      'إسوارة2',
     ],
   ],
   4:[
       [
      'براد1',
      'براد2',
      'براد3',
      'براد4',
      ],
     [
      'شاشة1',
      'شاشة2',
     ],
   ],
  };
  
  Map<int,dynamic> price1Map = {
    0:[
       [
      '40',
      '50',
      '60',
      ],
     [
      '20',
      '10',
     ],
     [
      '30',
      '60',
      '70',
      '50',
      '88',
      ],
   ],

   1:[
       [
      '20',
      '30',
      '50',
      ],
     [
      '40',
      '50',
     ],
     [
      '30',
      '40',
      '50',
      '50',
      '80',
      ],
   ],

   2:[
       [
      '10',
      '30',
      '20',
      '40',
      ],
     [
      '50',
      '70',
     ],
   ],
   3:[
       [
      '10',
      '30',
      '20',
      '40',
      ],
     [
      '50',
      '70',
     ],
   ],
   4:[
       [
      '10',
      '30',
      '20',
      '40',
      ],
     [
      '50',
      '70',
     ],
   ],
  };
  
  Map<int,dynamic> price2Map = {
    0:[
       [
      '50',
      '60',
      '70',
      ],
     [
      '30',
      '20',
     ],
     [
      '40',
      '70',
      '80',
      '60',
      '98',
      ],
   ],

   1:[
       [
      '30',
      '40',
      '60',
      ],
     [
      '50',
      '60',
     ],
     [
      '40',
      '50',
      '60',
      '70',
      '80',
      ],
   ],

   2:[
       [
      '10',
      '30',
      '20',
      '40',
      ],
     [
      '50',
      '70',
     ],
   ],
   3:[
       [
      '10',
      '30',
      '20',
      '40',
      ],
     [
      '50',
      '70',
     ],
   ],
   4:[
       [
      '10',
      '30',
      '20',
      '40',
      ],
     [
      '50',
      '70',
     ],
   ],
  };

  Map<int,dynamic> photoMap = {
    0:[
       [
      'assets/images/mentshirt.png',
      'assets/images/mentshirt.png',
      'assets/images/mentshirt.png',
      ],
     [
      'assets/images/menshoes.jpg',
      'assets/images/menshoes.jpg',
     ],
     [
      'assets/images/jeansphoto.jpg',
      'assets/images/jeansphoto.jpg',
      'assets/images/jeansphoto.jpg',
      'assets/images/jeansphoto.jpg',
      'assets/images/jeansphoto.jpg',
      ],
   ],

   1:[
       [
      'assets/images/dressphoto.jpg',
      'assets/images/dressphoto.jpg',
      'assets/images/dressphoto.jpg',
      ],
     [
      'assets/images/heel.jpg',
      'assets/images/heel.jpg',
     ],
     [
      'assets/images/watchphoto.jpg',
      'assets/images/watchphoto.jpg',
      'assets/images/watchphoto.jpg',
      'assets/images/watchphoto.jpg',
      'assets/images/watchphoto.jpg',
      ],
   ],

   2:[
       [
      'assets/images/toy.jpg',
      'assets/images/toy.jpg',
      'assets/images/toy.jpg',
      'assets/images/toy.jpg',
      ],
     [
      'assets/images/baby-shoes.jpg',
      'assets/images/baby-shoes.jpg',
     ],
   ],
   3:[
       [
      'assets/images/ringimg.jpg',
      'assets/images/ringimg.jpg',
      'assets/images/ringimg.jpg',
      'assets/images/ringimg.jpg',
      ],
     [
      'assets/images/braceletimg.jpg',
      'assets/images/braceletimg.jpg',
     ],
   ],
   4:[
       [
      'assets/images/fridgeimg.jpg',
      'assets/images/fridgeimg.jpg',
      'assets/images/fridgeimg.jpg',
      'assets/images/fridgeimg.jpg',
      ],
     [
      'assets/images/tvimg.jpg',
      'assets/images/tvimg.jpg',
     ],
   ],
  };

  void changeGender(index){
    gender = index;
    update();
  }


  void carouselChange1(int index){
    currentPage1=index;
    update();
  }

  void carouselChange2(int index){
    currentPage2=index;
    update();
  }

  void carouselChange3(int index){
    currentPage3=index;
    update();
  }

  void changeCategoryColor(int index){
    selectedIndex = index;
    update();
  }

  void changeColor(int index){
    selectedColor = index;
    update();
  }

  void changeSize(int index){
    selectedSize = index;
    update();
  }
}