import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_app/logic/controller/auth_controller.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/button_utils.dart';
import 'package:shop_app/view/widget/profile_info_item.dart';
import 'package:shop_app/view/widget/updatetextfield.dart';

// ignore: must_be_immutable
class PersonInfoPage extends StatelessWidget {
  PersonInfoPage({ Key? key }) : super(key: key);

  final authController = Get.find<AuthController>();
  
  String fName = GetStorage().read('fname');
  String lName = GetStorage().read('lname');
  String email = GetStorage().read('email');
  String phoneNumber = GetStorage().read('phone');

  List<String> personList = [
    'الاسم',
    'اللقب',
    'البريد الإلكتروني',
    'رقم الموبايل',
  ];

  List<String> updatePersonInfoList = [
    'الاسم',
    'اللقب',
    'البريد الإلكتروني',
    'كلمة السر',
    'تاكيد كلمة السر',
    'رقم الموبايل',
  ];

  final TextEditingController firstName = TextEditingController();

  final TextEditingController lastName = TextEditingController();

  final TextEditingController emailKey = TextEditingController();

  final TextEditingController passKey = TextEditingController();

  final TextEditingController repassKey = TextEditingController();

  final TextEditingController number = TextEditingController();

  late List<TextEditingController> controllersList;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    List<String> personInfoList = [
    fName,
    lName,
    email,
    phoneNumber,
    ];

    controllersList = [
      firstName,
      lastName,
      emailKey,
      passKey,
      repassKey,
      number
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('معلومات الحساب',
                    style: TextStyle(
                        color: blackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                GetBuilder<AuthController>(
                  builder: (_){
                    return authController.ifUpdateProfile?
                    IconButton(
                      onPressed: (){
                        authController.changeUpdateProfile(false);
                      }, 
                      icon: const Icon(
                        Icons.forward_sharp,
                        color: mainColor,
                        size: 30,
                        ),
                      ):
                  Container();
                })
                
              ],
            ),

            SizedBox(height: h*0.012,),

            Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'),
                  fit: BoxFit.cover, 
                  ),
              ),
            ),
            SizedBox(height: h*0.025,),
              ////
            GetBuilder<AuthController>(
              builder: (_){
              return authController.ifUpdateProfile?
            Container():
            InkWell(
              onTap: (){
                authController.changeUpdateProfile(true);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('تعديل الحساب',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                
                  Icon(
                    Icons.edit,
                    size: 20,
                    color: mainColor,
                    )
                ],
              ),
            );
            }),
            
            SizedBox(height:h*0.025,),

            /////////////////////////
            GetBuilder<AuthController>(
              builder: (_){
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return authController.ifUpdateProfile?
                        SizedBox(
                          height: 70,
                          width: double.infinity,
                          child: 
                          updateTextField(
                            control: controllersList[index],
                            label: updatePersonInfoList[index],
                          ),
                          
                        ):
                        profileInfoItem(
                          label: personList[index],
                          info: personInfoList[index]
                        );
                  
                  }, 
                  separatorBuilder: (context,index){
                    return authController.ifUpdateProfile?
                    SizedBox(height: h*0.01,):
                    SizedBox(height: h*0.02,);
                  },  
                  itemCount: authController.ifUpdateProfile?
                  updatePersonInfoList.length:
                  personList.length,
                );
            }
            ),

            SizedBox(height: h*0.025,),

            GetBuilder<AuthController>(
              builder: (_){
                return 
                authController.ifUpdateProfile?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                  width: double.infinity,
                  child: buttomUtils(
                        ontab: (){
                          authController.changeUpdateProfile(false);
                        },

                        childtext: const Text('تحديث المعلومات'),
                        maincolor: mainColor,
                        radius: 25, 
                        leftpadding: 0, 
                        rightpadding: 0, 
                        toppadding: 10, 
                        buttompadding: 10,
                        c: mainColor,
                      ),
                  ),
                ):
                Container();
              }
            ),

          ],
        ),
      ),
    );
  }
}