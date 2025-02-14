import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/body_add_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCommentView extends StatelessWidget {
  const AddCommentView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomTitleLogo(),
        ),
        body: BodyAddComment(
          name: name,
        ),
      ),
    );
  }
}
