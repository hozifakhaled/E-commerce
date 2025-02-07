import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFromFiled extends StatelessWidget {
  const CustomTextFromFiled({
    super.key,
    required this.hinttext,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.onChanged,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String hinttext;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText:obscureText,
      decoration: InputDecoration(

          suffixIcon: suffixIcon,
          hintText: hinttext,
          

          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: textcoloroto2,
                width: 1), // Border style when the text field is enabled
            borderRadius: BorderRadius.all(
                Radius.circular(20)), // Rounded corners for the border
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: textcoloroto2,
                width: 1), // Border style when the text field is enabled
            borderRadius: BorderRadius.all(
                Radius.circular(20)), // Rounded corners for the border
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: textcoloroto2,
                width: 1), // Border style when the text field is enabled
            borderRadius: BorderRadius.all(
                Radius.circular(20)), // Rounded corners for the border
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: maincolor,
                width: 1), // Border style when the text field is enabled
            borderRadius: BorderRadius.all(
                Radius.circular(20)), // Rounded corners for the border
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red,
                width: 1), // Border style when the text field is enabled
            borderRadius: BorderRadius.all(
                Radius.circular(20)), // Rounded corners for the border
          )),
    );
  }
}
