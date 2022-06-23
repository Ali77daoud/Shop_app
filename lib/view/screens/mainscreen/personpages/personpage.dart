// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/options_item.dart';
import 'package:shop_app/view/widget/person_widget.dart';

class PersonPage extends StatelessWidget {
  PersonPage({ Key? key }) : super(key: key);
  final authController = Get.put(AuthController());

  String fName = GetStorage().read('fname');
  String lName = GetStorage().read('lname');
  String email = GetStorage().read('email');
  
  
  List<IconData> iconsList = [
    Icons.file_copy_outlined,
    Icons.drive_folder_upload_rounded,
    Icons.person_pin_circle_rounded,
    Icons.favorite,
    Icons.message,
    Icons.logout,
  ];

  List<String> nameList = [
    'ملف',
    'طلبات',
    'معلومات الحساب',
    'قائمة الرغبات',
    'رسائل',
    'تسجيل الخروج',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Center(
              child: Text('حساب',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                ),
            ),
            personWidget(
              imgHight: 100, 
              imgWidth: 100, 
              img: 'assets/images/1.jpg',
              fname: fName,
              lname: lName,
              email: email
              ),
            const SizedBox(height: 20,),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: optionItem(
                  text: nameList[index],
                  onTap: (){
                    if(nameList[index]=='معلومات الحساب'){
                      authController.changeUpdateProfile(false);
                      Get.toNamed(Routes.personInfo);
                    }

                    if(nameList[index]=='تسجيل الخروج'){
                      authController.logOut();
                    }
                  },
                  icon: iconsList[index]
                  
              ),
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount: 6,
            ),
          ],
        ),
      ),
    );
  }
}