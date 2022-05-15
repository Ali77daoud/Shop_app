import 'package:flutter/material.dart';

Widget defualTextFormFeild({
  required TextEditingController controller,
  required TextInputType inputtype,
  var onSbmit,
  var onChange,
  required int maxlines,
  required bool ifobscure,
  required var validate,
  required String label,
  required Color labelcolor,
  required Color inputtextcolor,
  required Widget prifixicon,
  required Widget sufixicon,
  required var ontab,
  required Color cursorColor,
  required Color backgrouncolor,
  required double borderraduis,
  required Color bordercolor,
  required Color focusbordercolor,
  String? hint,
  var padding,
})=> TextFormField(
  textAlign: TextAlign.right,
  controller: controller ,
  keyboardType:inputtype ,
  style: TextStyle(
        color: inputtextcolor,
          ),
  onFieldSubmitted: onSbmit,
  maxLines: maxlines,
  obscureText: ifobscure,
  onChanged: onChange,
  onTap: ontab ,
  validator: validate,
  cursorColor: cursorColor,
  decoration: InputDecoration(
    contentPadding: padding,
    hintText: hint,
    hintStyle: TextStyle(
      color: Colors.grey.shade400,
      fontSize: 13,
    ),
    filled: true,
    fillColor: backgrouncolor,

    labelText: label,
    labelStyle: TextStyle(color:labelcolor,fontSize: 15),
    prefixIcon: prifixicon,
    suffixIcon: sufixicon,
    enabledBorder:  OutlineInputBorder(
      borderSide: BorderSide(color: bordercolor),
      borderRadius: BorderRadius.circular(borderraduis),
    ),
    focusedBorder:  OutlineInputBorder(
      borderSide: BorderSide(color: focusbordercolor),
      borderRadius: BorderRadius.circular(borderraduis),
    ),
  ), 
);
