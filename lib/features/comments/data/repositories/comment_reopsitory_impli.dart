import 'package:ecommercefirebase/core/connection/network_info.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/comments/data/datasources/comment_data_source_remote.dart';
import 'package:ecommercefirebase/features/comments/data/datasources/comment_data_sourse_local.dart';
import 'package:ecommercefirebase/features/comments/data/models/comments_model.dart';
import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/repositories/comment_repository.dart';

class CommentReopsitoryImpli implements CommentRepository {
  final FirebaseConsumer firebaseConsumer;
  final NetworkInfo networkInfo;
  final CommentsDataSourceRemote remote;
  final CommentDataSourseLocal local;

  CommentReopsitoryImpli(
      {required this.networkInfo,
      required this.remote,
      required this.local,
      required this.firebaseConsumer});
  @override
  Future<void> addComment(CommentEntity commentEntity) async {
    try {
      firebaseConsumer.adddatadoc('comment',commentEntity.email ,{
        'email': commentEntity.email,
        'like': commentEntity.like,
        'comment': commentEntity.comment,
        'image': commentEntity.image,
        'islike': commentEntity.islike
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<CommentsModel>> allComment() async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remote.fatchlistcomments();

        local.cacheComments(remoteUser);
        return remoteUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    } else {
      try {
        final localUser = await local.getLastCommment();
        return localUser;
      } on Exception catch (e) {
        throw Exception(e.toString());
      }
    }
  }

  @override
  Future<void> updatelike(String id, CommentEntity commment)async {
   await firebaseConsumer.updatedata(
        'comment', id, {'like': commment.like, 'islike': commment.islike});
  }
}
