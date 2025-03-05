import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/widgets/custom_title_logo.dart';
import 'package:ecommercefirebase/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/body_add_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCommentView extends StatelessWidget {
  const AddCommentView({super.key, required this.data, });
  final Map<String, dynamic> data; 
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(),
      child: Scaffold(
        backgroundColor: maincolor2,
        appBar: AppBar(
          backgroundColor: maincolor2,
          title:CustomTitleLogo(
            textcolor1: Colors.black,
            textcolor2: maincolor,
          ),
        ),
        body: BodyAddComment(
          name: data['name'],
        ),
      ),
    );
  }
}
