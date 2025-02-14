import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/repositories/comment_repository.dart';

class CommentReopsitoryImpli implements CommentRepository {
  final FirebaseConsumer firebaseConsumer;

  CommentReopsitoryImpli({required this.firebaseConsumer});
  @override
  Future<void> addComment(CommentEntity commentEntity) async {
    try {
      firebaseConsumer.adddata('comment', {
        'email': commentEntity.email,
        'likes': commentEntity.like,
        'comment': commentEntity.comment
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
