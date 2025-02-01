import 'package:ecommercefirebase/core/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchTextFiledInHome extends StatelessWidget {
  const searchTextFiledInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      prefixIcon: Icon(Icons.search),
      label: Text('Search'),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
      filled: true,
      fillColor: TextFieldColor,
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.white)),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
    ));
  }
}
