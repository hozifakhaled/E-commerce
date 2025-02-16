// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/features/comments/data/repositories/comment_reopsitory_impli.dart';
import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/usecases/update_like.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(LikeInitial());
  void toggleLike(String id, int like, bool isLiked) {
    // تحديث الحالة فورًا بدون انتظار Firestore
    final newLikeCount = isLiked ? like - 1 : like + 1;
    final newIsLiked = !isLiked;

    emit(CommentsUpdated(id, newLikeCount, newIsLiked));

    // تحديث Firestore في الخلفية
    if (newIsLiked) {
      final updateMethod = updatalikein;
      updateMethod(id, newLikeCount, newIsLiked);
    }else{
final updateMethod = updatalikedn;
 updateMethod(id, newLikeCount, newIsLiked);
    }

    
  }

  updatalikein(String id, int like, bool islike) {
    UpdateLike(repository: getIt.get<CommentReopsitoryImpli>()).call(
        id,
        CommentEntity(
            like: like, islike: islike, email: '', comment: '', image: ''));
  }

  updatalikedn(String id, int like, bool islike) {
    UpdateLike(repository: getIt.get<CommentReopsitoryImpli>()).call(
        id,
        CommentEntity(
            like: like, islike: islike, email: '', comment: '', image: ''));
  }
}
