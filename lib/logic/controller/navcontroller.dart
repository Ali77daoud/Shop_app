import 'package:get/get.dart';

class NavController extends GetxController{
  int i = 0;
  int currentPage = 0;
  int selectedIndex = 0;
  int selectedColor = 0;
  int selectedSize = 0;

  void changePage(index){
    i = index;
    update();
  }

  void carouselChande(int index){
    currentPage=index;
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