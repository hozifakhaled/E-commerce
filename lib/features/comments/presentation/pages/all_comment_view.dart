import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:flutter/material.dart';

class AllCommentView extends StatelessWidget {
  const AllCommentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTitleLogo(),
      )
    );
  }
}