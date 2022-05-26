import 'package:get/get.dart';

class NavController extends GetxController{
  int homePageIndex = 0;
  int shopPageIndex = 0;
  int currentPage1 = 0;
  int currentPage2 = 0;
  int currentPage3 = 0; 
  int selectedIndex = 0;
  int selectedColor = 0;
  int selectedSize = 0;
  int productDetailsIndex = 0;

  String category = 'قمصان';

  List<String> categoryList=[
    'قمصان',
    'فساتين',
    'أحذية',
  ];

  Map<String,dynamic> categoryMap = {
    'قمصان': [
          [
            'قمصان',
            '30',
            '20',
          ],
          [
            'قمصان',
            '30',
            '20',
          ],
          [
            'قمصان',
            '40',
            '10',
          ],
          [
            'قمصان',
            '50',
            '30',
          ],
        ],
        
    'فساتين':  [
          [
            'فساتين',
            '70',
            '40',
          ],
          [
          'فساتين',
            '20',
            '30',
          ],
          [
          'فساتين',
            '70',
            '90',
          ],
          [
            'فساتين',
            '50',
            '30',
          ],
        ],

    'أحذية' : [
    [
      'أحذية',
      '30',
      '20',
    ],
    [
      'أحذية',
      '30',
      '20',
    ],
    [
      'أحذية',
      '40',
      '10',
    ],
    [
      'أحذية',
      '50',
      '30',
    ],
    [
      'أحذية',
      '50',
      '30',
    ],
  ],

  };

  Map<String,dynamic> catMap = {
    'رجال': {
      'قمصان':[
        'قميص1',
        'قميص2',
        'قميص3'
      ],
      'أحذية':[
        'حذاء1',
        'حذاء2',
        'حذاء3'
      ],
      'ساعات':[
        'ساعه1',
        'ساعه2',
        'ساعه3'
      ],
    },
    'نساء': {
      'فساتين':[
        'قميص1',
        'قميص2',
        'قميص3'
      ],
      'أحذية':[
        'حذاء1',
        'حذاء2',
        'حذاء3'
      ],
      'ساعات':[
        'ساعه1',
        'ساعه2',
        'ساعه3'
      ],
    },
  };


  void changeHomePage(index){
    homePageIndex = index;
    update();
  }

  void changeShopPage(index){
    shopPageIndex = index;
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