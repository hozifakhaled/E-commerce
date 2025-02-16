import 'package:ecommercefirebase/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:ecommercefirebase/features/comments/presentation/widgets/commment_in_all_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListComments extends StatelessWidget {
  const ListComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is FatchComments) {
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.comments.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CommmentInAllComment(commentEntity: state.comments[index],),
             
            );
          },
        );
        } else if (state is CommentsError) {
                return Center(child: Text(state.error));
              }else{
                return const Center(child: CircularProgressIndicator());
              }
      },
    );
  }
}
