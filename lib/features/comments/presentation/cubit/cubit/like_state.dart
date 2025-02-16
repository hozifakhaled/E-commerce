part of 'like_cubit.dart';

sealed class LikeState {}

final class LikeInitial extends LikeState {}
class CommentsUpdated extends LikeState {
  final String id;
  final int like;
  final bool isLiked;

  CommentsUpdated(this.id, this.like, this.isLiked);
}
