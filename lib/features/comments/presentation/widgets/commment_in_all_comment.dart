import 'package:ecommercefirebase/constants/images.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/column_username_and_comment_in_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommmentInAllComment extends StatelessWidget {
  const CommmentInAllComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * .34,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          spacing: 10.h,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 50.h,
                width: 50.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    Assets.imagesTrangs,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            ColumnUsernameAndCommentInComment(),
        
            
          ],
        ),
      ),
    );
  }
}

