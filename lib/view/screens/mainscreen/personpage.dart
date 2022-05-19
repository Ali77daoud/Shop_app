import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';
import 'package:shop_app/view/widget/options_item.dart';
import 'package:shop_app/view/widget/person_widget.dart';

class PersonPage extends StatelessWidget {
  PersonPage({ Key? key }) : super(key: key);

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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed:(){
    
              },
              icon: const Icon(Icons.arrow_back,color: blackColor,) 
              ),
            SizedBox(width: w*0.35,),
            const Text('حساب',
                style: TextStyle(
                    color: mainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
              ),
          ],
        ),
        PersonWidget(
          imgHight: 100, 
          imgWidth: 100, 
          img: 'assets/images/1.jpg',
          name: 'تركي السفياني',
          email: 'aaa@gmail.com'
          ),
        SizedBox(height: h*0.022,),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OptionItem(
                text: nameList[index],
                onTap: (){
                  
                },
                icon: iconsList[index]
                
            ),
              );
            },
            separatorBuilder: (context,index){
              return const SizedBox(height: 15,);
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}