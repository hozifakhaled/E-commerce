import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyAddComment extends StatelessWidget {
  const BodyAddComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add Comment',
              style: Textstyles.text20.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(
            height: context.height * .3,
            child: CustomTextFromFiled(
              maxLines: 8,
              hinttext: 'Write everything you like about the application',
            ),
            
          ),
          Spacer(),
          
          
            ButtonApp(text: 'Submit', color: maincolor, colortext: maincolor2, onPressed: (){}),
         
        ],
      ),
    );
  }
}
