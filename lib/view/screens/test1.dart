import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';

class Test1 extends StatelessWidget {
  const Test1({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: (){
                Get.toNamed(Routes.test2);
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
          ),   
        ],
      ),
    );
  }
}