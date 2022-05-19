import 'package:get/get.dart';

class NavController extends GetxController{
  int i = 0;
  int currentPage1 = 0;
  int currentPage2 = 0;
  int currentPage3 = 0;
  int selectedIndex = 0;
  int selectedColor = 0;
  int selectedSize = 0;

  void changePage(index){
    i = index;
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