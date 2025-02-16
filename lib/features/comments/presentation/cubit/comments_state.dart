part of 'comments_cubit.dart';

abstract class CommentsState{}

class CommentsInitial extends CommentsState {}

class CommentsLoaded extends CommentsState {}


class FatchComments extends CommentsState {
 final List<CommentEntity> comments;

  FatchComments({required this.comments});
}
class CommentsUpdated extends CommentsState {
  final String id;
  final int like;
  final bool isLiked;

  CommentsUpdated(this.id, this.like, this.isLiked);
}
class CommentsError extends CommentsState {
  final String error;

  CommentsError({required this.error});
}
