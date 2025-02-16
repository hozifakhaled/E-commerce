import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/repositories/comment_repository.dart';

class AllComment {
  final CommentRepository commentRepository;

  AllComment(this.commentRepository);

  Future<List<CommentEntity>> call() => commentRepository.allComment();
}