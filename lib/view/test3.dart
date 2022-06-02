import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/view/screens/test1.dart';

class Test3 extends StatelessWidget {
  const Test3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test 3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: (){
                Get.offAllNamed(Routes.test1);
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}