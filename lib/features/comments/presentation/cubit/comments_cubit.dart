// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/database/firebase/firebase_consumer.dart';
import 'package:ecommercefirebase/features/comments/data/repositories/comment_reopsitory_impli.dart';
import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/usecases/add_comment.dart';
import 'package:flutter/material.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());
  String? comment;
  TextEditingController textEditingController = TextEditingController();
  addcomment(String email, String comment) {
    try {
      AddComment(CommentReopsitoryImpli(firebaseConsumer: FirebaseConsumer()))
          .call(CommentEntity(like: 0, email: email, comment: comment));
      emit(CommentsLoaded());
    } on Exception catch (e) {
      emit(CommentsError(error: e.toString()));
    }
  }
}
