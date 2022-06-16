
import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget cartWidget(
  {
    required String productName,
    required String productDescription,
    required String totalPrice,
    required String productQuantity,
    required var onIncrease,
    required var onDelete,
  }
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
              Text(
                productName,
                maxLines: 2,
                style: const TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Text(
                productDescription,
                maxLines: 2,
                style: const TextStyle(
                  color: blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
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
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                    ),

                      Text(
                      productQuantity,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ),

                      InkWell(
                        onTap: onIncrease,
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
              Text(
                '$totalPrice \$',
                maxLines: 2,
                style: const TextStyle(
                  color: mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
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
                  onPressed: onDelete,
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