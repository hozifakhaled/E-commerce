import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class buttonApp extends StatelessWidget {
  const buttonApp({
    super.key, this.onPressed, required this.text, required this.color, required this.colortext,
  });
  final String text ;
  final void Function()? onPressed;
  final Color color ;
  final Color colortext ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colortext, width: 1),
        color: color,
      ),
      width: double.infinity,
      height: context.height * .07,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text ,
          style: Textstyles.text20.copyWith(color: colortext),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
