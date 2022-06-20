import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/model/cartmodels/addtocartmodel.dart';
import 'package:shop_app/model/cartmodels/couponmodel.dart';
import 'package:shop_app/model/cartmodels/getfromcart.dart';
import 'package:shop_app/model/cartmodels/removefromcart.dart';
import 'package:shop_app/model/cartmodels/updatecartmodel.dart';
import 'package:shop_app/model/categorymodel/branchesmodel.dart';
import 'package:shop_app/model/categorymodel/brands.dart';
import 'package:shop_app/model/categorymodel/maincategorymodel.dart';
import 'package:shop_app/model/categorymodel/productmodel.dart';
import 'package:shop_app/model/categorymodel/subcategorymodel.dart';
import 'package:shop_app/services/network/cartapi.dart';
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
  

  final authController = Get.put(AuthController());

  @override
  void onInit() async{
    super.onInit();
    String? token = authController.token.read<String>('t');
    isLoadingCategory = true;
    await getCategories(token:token.toString()).then((value)async{
      await getLast10Products(token: token.toString()).then((value)async{
        await getSubCategories();
      });
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

  Future<void> getCategories({
    required String token,
  })async{
    try{
      MainCategoryModel res = await CategoryApi.getMainCategories(token: token);
      dataCategoryList.value = res.data!;
      update();
    }catch(e){
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
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
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
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
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
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
      isLoadingproducts = false;
      update();
    }catch(e){
      isLoadingproducts = false;
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }
    
  }


  //brands
  var dataBrandsList = <BrandsDataModel>[].obs;
  bool isLoadingBrands = false;
  int brandsId = 1;
  Future<void> getBrands()async{
    try{
      BrandsModel res = await CategoryApi.getBrands();
      dataBrandsList.value = res.data!;
      isLoadingBrands = false;
      update();
    }catch(e){
      isLoadingBrands = false;
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }
    
  }
//last 10 product
  List<ProductsDataModel>? dataLast10productsList ;

  Future<void> getLast10Products(
    {
      required String token,
    }
  )async{
    try{
      ProductsModel res = await CategoryApi.getLast10ProductsApi(
        token: token
      );

      dataLast10productsList = res.data!;

      
      update();
    }catch(e){
      isLoadingproducts = false;
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }
  }
  /////////////////////////////////////// cart ////////////////////////////////////
  
  //add to cart

  AddToCartModel? addtoCart;
  bool ifAddToCart = false;

  Future<void> addToCart(
    {
      required int userId,
      required int productId,
      required int quantity,
      required int maxPrice,
      required String token,
    }
  )async{
    try{
      addtoCart = await CartApi.addToCartApi(
        userId: userId,
        productId: productId, 
        quantity: quantity, 
        maxPrice: maxPrice, 
        token: token
        );
      // Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        addtoCart!.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }catch(e){
      Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        'there is a problem',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }
    
  }

  //get from cart 
  CartDataModel? cartData;
  double? priceForAllProduct;
  int cartProductNumber = 0;
  bool isGetCartData = false;

  List<CartProductDetailsModel>? productDetails;

  Future<void> getFromCart(
    {
      required int userId,
      required String token,
    }
  )async{
    try{
      final res = await CartApi.getFromCartApi(
        userId: userId,
        token: token
        );
      cartData = res.data;

      priceForAllProduct = res.data!.price_for_all_thing!.toDouble();
      cartProductNumber = res.data!.Product_detailss!.length.toInt();
      isGetCartData = false;
      Get.snackbar(
        '',
        res.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }catch(e){
      Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 8)
        );
      update();
    }
    
  }

  //remove from cart
  RemoveFromCartModel? removefromCartData;
  bool ifremovefromCart = false;

  Future<void> removefromCart(
    {
      required int userId,
      required int productId,
      required String token,
    }
  )async{
    try{
      removefromCartData = await CartApi.removeFromCartApi(
        userId: userId,
        productId: productId,  
        token: token
        );
      
      Get.snackbar(
        '',
        removefromCartData!.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }catch(e){
      Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }
    
  }

  //update from cart
  UpdateCartModel? updateCartData;
  bool ifupdateCart = false;

  Future<void> updateCart(
    {
      required int userId,
      required int productId,
      required int quantity,
      required int price,
      required String token,
    }
  )async{
    try{
      updateCartData = await CartApi.updateCartApi(
        userId: userId,
        price: price,
        productId: productId,
        quantity: quantity,
        token: token
        );
      
      Get.snackbar(
        '',
        updateCartData!.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }catch(e){
      Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
      update();
    }
    
  }

  //coupon cart
  CouponCartModel?couponCartData;
  bool ifcouponCart = false;

  Future<void> couponCart(
    {
    required String code,
    required double totalPrice,
    required String token,
    }
  )async{
    try{
      couponCartData = await CartApi.couponCartApi(
        code: code,
        totalPrice: totalPrice,
        token: token
        );
      
      priceForAllProduct = couponCartData!.data;

      Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        couponCartData!.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
      );
      update();
    }catch(e){
      Get.back(closeOverlays: true);
      Get.snackbar(
        '',
        e.toString().split(':')[1],
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3)
        );
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