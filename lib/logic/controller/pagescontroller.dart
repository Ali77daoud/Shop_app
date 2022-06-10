import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/model/categorymodel/branchesmodel.dart';
import 'package:shop_app/model/categorymodel/maincategorymodel.dart';
import 'package:shop_app/model/categorymodel/productmodel.dart';
import 'package:shop_app/model/categorymodel/subcategorymodel.dart';
import 'package:shop_app/services/network/categoryapi.dart';

class PagesController extends GetxController{
  int currentPage1 = 0;
  int currentPage2 = 0;
  int currentPage3 = 0; 
  int selectedIndex = 0;
  int selectedColor = 0;
  int selectedSize = 0;

  int productDetailsIndex = 0;

  int clothesIndex=0;
  

  @override
  void onInit() async{
    super.onInit();
    isLoadingCategory = true;
    await getCategories().then((value){
      getSubCategories();
    });
     
  }
  
  bool isLoadingCategory = false;
  //maincategory
  int mainCategoryId = 1;
  
  void changeGender(index){
    mainCategoryId = index;
    update();
  }

  var dataCategoryList = <MainCategoryDataModel>[].obs;

  Future<void> getCategories()async{
    try{
      MainCategoryModel res = await CategoryApi.getMainCategories();
      dataCategoryList.value = res.data!;
      update();
    }catch(e){
      update();
    }
    
  }

  //subcategory
  int subCategoryId = 1;

  var dataSubCategoryList = <SubCategoryDataModel>[].obs;
  bool isLoadingSubCategory = false;

  Future<void> getSubCategories()async{
    try{
      SubCategoriesModel res = await CategoryApi.getSubCategories();
      dataSubCategoryList.value = res.data!;
      isLoadingCategory=false;
      update();
    }catch(e){
      update();
    }
    
  }

  //barnches
  int barnchesId = 1;

  var dataBarnchesList = <BranchesDataModel>[].obs;
  bool isLoadingbarnches = false;

  Future<void> getBarnches()async{
    try{
      BranchesModel res = await CategoryApi.getBrunches();
      dataBarnchesList.value = res.data!;
      update();
    }catch(e){
      isLoadingbarnches=false;
      update();
    }
    
  }

  //products
  int productsId = 1;

  var dataproductsList = <ProductsDataModel>[].obs;
  bool isLoadingproducts = false;

  Future<void> getProduct()async{
    try{
      ProductsModel res = await CategoryApi.getProducts();
      dataproductsList.value = res.data!;
      isLoadingbarnches = false;
      update();
    }catch(e){
      isLoadingbarnches = false;
      update();
    }
    
  }

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