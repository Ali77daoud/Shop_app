import 'package:flutter/material.dart';
import 'package:shop_app/utils/theme.dart';

Widget updateTextField(
  {
    required TextEditingController control,
    required String label,
  } 
){
  return TextField(
          controller: control,
          keyboardType: TextInputType.text,
          cursorColor: mainColor,
          decoration: InputDecoration(
            label: Text(label,
                style: const TextStyle(
                    color: greyColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
            filled: true,
            fillColor: main2Color,
            enabledBorder: OutlineInputBorder(      
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25),   
          ),  
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
    
    );
}