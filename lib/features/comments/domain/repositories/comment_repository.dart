import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<void> addComment(CommentEntity commentEntity);
  Future<List<CommentEntity>> allComment();
  Future<void> updatelike(String id, CommentEntity commment);
}
