import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/repositories/comment_repository.dart';

class AddComment {
  final CommentRepository repository;
  AddComment(this.repository);
  Future<void> call(CommentEntity commentEntity) => repository.addComment(commentEntity);
}