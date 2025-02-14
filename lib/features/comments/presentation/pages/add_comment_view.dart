import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/body_add_comment.dart';
import 'package:flutter/material.dart';

class AddCommentView extends StatelessWidget {
  const AddCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomTitleLogo(),
      ),
      body: BodyAddComment(),
    );
  }
}