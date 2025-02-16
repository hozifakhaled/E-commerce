import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/repositories/comment_repository.dart';

class UpdateLike {
  final CommentRepository repository;

  UpdateLike({required this.repository});
  Future<void> call(String id, CommentEntity commment) async {
    return repository.updatelike(id, commment);
  }
}