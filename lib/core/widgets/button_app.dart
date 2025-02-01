import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:ecommercefirebase/core/styles/extention.dart';
import 'package:ecommercefirebase/core/styles/textstyles.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class buttonApp extends StatelessWidget {
  const buttonApp({
    super.key, this.onPressed, required this.text,
  });
  final String text ;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: maincolor,
      ),
      width: double.infinity,
      height: context.height * .08,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text ,
          style: Textstyles.text2button,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
