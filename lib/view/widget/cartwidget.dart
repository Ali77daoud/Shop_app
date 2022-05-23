
import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget CartWidget(

){
  return SizedBox(
    width: double.infinity,
    height: 105,
    child: Row(
      children: [
        Container(
          width: 100,
          height: 105,
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(width: 10,),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'قمصان',
                maxLines: 2,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),

              const Text(
                'أزياء نساء',
                maxLines: 2,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),

              const Spacer(),
              
              Container(
                width: 110,
                height: 35,
                decoration: BoxDecoration(
                  color: greyColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){

                      },
                      child: const Text(
                        '-',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                    ),

                      const Text(
                      '333',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),

                      InkWell(
                        onTap: (){

                        },
                        child: const Text(
                        '+',
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Column(
            children: [
              const Text(
                '33.33 \$',
                maxLines: 2,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),

              const Spacer(),


              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  ),

                  IconButton(
                  onPressed: (){

                  },
                   icon: const Icon(Icons.delete,color:whiteColor,)
                   ),
                ],
              )
            ],
          ),
        ),


      ],
    ),
  );
}