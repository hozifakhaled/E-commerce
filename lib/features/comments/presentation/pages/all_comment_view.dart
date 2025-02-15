import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/body_all_comment.dart';
import 'package:flutter/material.dart';

class AllCommentView extends StatelessWidget {
  const AllCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor2,
      appBar: AppBar(
        backgroundColor: maincolor2,
        title: CustomTitleLogo(),
      ),
      body:const BodyAllComment()
    );
  }
}