import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ecommercefirebase/core/helper/helpers.dart';
import 'package:ecommercefirebase/core/utlis/colors.dart';
import 'package:ecommercefirebase/core/utlis/extention.dart';
import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/core/widgets/button_app.dart';
import 'package:ecommercefirebase/core/widgets/custom_text_from_filed.dart';
import 'package:ecommercefirebase/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyAddComment extends StatelessWidget {
  const BodyAddComment({super.key, required this.name, required this.image});
  final String name;
  final String image;
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
              controller: context.read<CommentsCubit>().textEditingController,
              onChanged: (p0) {
                context.read<CommentsCubit>().comment = p0;
              },
              hinttext: 'Write everything you like about the application',
            ),
          ),
          Spacer(),
          BlocListener<CommentsCubit, CommentsState>(
            listener: (context, state) {
              if (state is CommentsLoaded) {
                Helpers()
                    .alertDone(context, 'done', 'comment successfully', null,
                        null, DialogType.success)
                    .show();
              }
              if (state is CommentsError) {
                Helpers()
                    .alertDone(context, 'Error', state.error.toString(), null,
                        null, DialogType.error)
                    .show();
              }
            },
            child: ButtonApp(
                text: 'Submit',
                color: maincolor,
                colortext: maincolor2,
                onPressed: () {
                  context.read<CommentsCubit>().addcomment(
                      name, context.read<CommentsCubit>().comment!, image);
                  context.read<CommentsCubit>().textEditingController.clear();
                }),
          ),
        ],
      ),
    );
  }
}
