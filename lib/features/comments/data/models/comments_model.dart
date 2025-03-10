import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';

class CommentsModel extends CommentEntity {
  CommentsModel({required  super.islike, 
      required super.like,
      required super.email,
      required super.comment,
     });
  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    islike: json['islike'],
      like: json['like'],
      email: json['email'],
      comment: json['comment'],
  );

  Map<String, dynamic> toJson() =>
      {'likes': like, 'email': email, 'comment': comment};
}
