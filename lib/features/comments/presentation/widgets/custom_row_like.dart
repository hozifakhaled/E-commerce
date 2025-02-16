import 'package:ecommercefirebase/core/utlis/textstyles.dart';
import 'package:ecommercefirebase/features/comments/presentation/cubit/cubit/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRowLike extends StatelessWidget {
  const CustomRowLike({
    super.key,
    required this.like,
    required this.islike,
    required this.id,
  });

  final int like;
  final bool islike;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeCubit, LikeState>(
      builder: (context, state) {
        final likeCubit = context.read<LikeCubit>();

        int currentLikes = like;
        bool currentIsLiked =  islike;

        if (state is CommentsUpdated && state.id == id) {
          currentLikes = state.like;
          currentIsLiked = state.isLiked;
        }

        return Row(
          children: [
            IconButton(
              onPressed: () {
                likeCubit.toggleLike(id, currentLikes, currentIsLiked);
              },
              icon: Icon(
                currentIsLiked ? Icons.favorite : Icons.favorite_border,
                color: currentIsLiked ? Colors.red : Colors.grey,
              ),
            ),
            Text(
              currentLikes.toString(),
              style: Textstyles.text12,
            ),
          ],
        );
      },
    );
  }
}
