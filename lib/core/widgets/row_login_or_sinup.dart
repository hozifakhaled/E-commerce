import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:flutter/material.dart';

import '../utlis/colors.dart';

class RowSinupOrLogin extends StatelessWidget {
  const RowSinupOrLogin({
    super.key,
    this.onTap, required this.text, required this.button,
  });
  final void Function()? onTap;
  final String text ;
  final String button;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Textstyles.text18
              .copyWith( fontWeight: FontWeight.w400),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            button,
            style: Textstyles.text18.copyWith(
                 color: maincolor, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
