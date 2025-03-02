import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({super.key, required this.title, required this.value});
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          overflow: TextOverflow.clip,
          style: Textstyles.text16.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          width: context.width * .7,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: .4),
            ),
          ),
          child: Text(
            overflow: TextOverflow.clip,
            '   $value',
            style: Textstyles.text14,
          ),
        ),
      ],
    );}
}