import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class phoneTextfiledInOtp extends StatelessWidget {
  const phoneTextfiledInOtp({
    super.key,
    required this.onSaved, this.controller,
  });
  final void Function(String?)? onSaved;
 final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator:(phoneNumber) {

 
  if (phoneNumber!.isEmpty) {
    return 'رقم الهاتف مطلوب';
  } else if (phoneNumber.length<12) {
    return 'أدخل رقم هاتف بصيغة صحيحة (مثال: +16561665307)';
  }
  return null;
}
     ,
      onChanged: onSaved,
      keyboardType: TextInputType.phone, // Set the keyboard type to phone
      decoration: InputDecoration(
        suffixIcon: Icon(Icons
            .edit_calendar_outlined), // Add an icon at the end of the text field
        hintText: '+20 1061665307', // Placeholder text

        suffixIconColor: textcoloroto2, // Color of the suffix icon
        hintStyle: TextStyle(color: textcoloroto2), // Style for the hint text
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: textcoloroto2,
              width: 2), // Border style when the text field is enabled
          borderRadius: BorderRadius.all(
              Radius.circular(20)), // Rounded corners for the border
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: textcoloroto2,
              width: 2), // Border style when the text field is focused
          borderRadius: BorderRadius.all(
              Radius.circular(20)), // Rounded corners for the border
        ),
      ),
    );
  }
}
