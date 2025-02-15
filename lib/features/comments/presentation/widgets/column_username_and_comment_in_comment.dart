 import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/custom_row_like.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnUsernameAndCommentInComment extends StatelessWidget {
  const ColumnUsernameAndCommentInComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        SizedBox(
            height: 50.h,
            child: Padding(
              padding: const EdgeInsets.only(top: 9.0),
              child: Text(
                'Hozifa khaild',
                textAlign: TextAlign.center,
                style: Textstyles.text16,
              ),
            )),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
      height: context.height * .19,
      width: context.width *.76,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'whats The new?',
          style:
              Textstyles.text16.copyWith(color: Colors.grey.shade700),
        ),
      ),
    ),
    CustomRowLike()
      ],
    );
  }
}

