import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';

class CustomRowLike extends StatelessWidget {
  const CustomRowLike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Icons.favorite_border),
      Text('200',style: Textstyles.text12,),
    ],);
  }
}
