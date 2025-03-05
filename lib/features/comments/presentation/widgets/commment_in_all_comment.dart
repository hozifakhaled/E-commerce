import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/column_username_and_comment_in_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommmentInAllComment extends StatelessWidget {
  const CommmentInAllComment({
    super.key, required this.commentEntity,
  });
 final CommentEntity commentEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: context.height * .34,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade400)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 50.h,
                width: 50.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child:Center(child: Text(commentEntity.email.substring(0,1),style: Textstyles.text28,)),
                  ),
                ),
              ),
            ),
            ColumnUsernameAndCommentInComment(comment: commentEntity.comment, name: commentEntity.email,like: commentEntity.like, islike: commentEntity.islike,),
        
            
          ],
        ),
      ),
    );
  }
}

