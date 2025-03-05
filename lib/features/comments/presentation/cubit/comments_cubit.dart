// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:ecommercefirebase/core/helper/service_lecator.dart';
import 'package:ecommercefirebase/features/comments/data/repositories/comment_reopsitory_impli.dart';
import 'package:ecommercefirebase/features/comments/domain/entities/comment_entity.dart';
import 'package:ecommercefirebase/features/comments/domain/usecases/add_comment.dart';
import 'package:ecommercefirebase/features/comments/domain/usecases/all_comment.dart';
import 'package:flutter/material.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());
  String? comment;
  TextEditingController textEditingController = TextEditingController();
  addcomment(String email, String comment) {
    try {
      AddComment(getIt.get<CommentReopsitoryImpli>()).call(CommentEntity(
          like: 0,
          email: email,
          comment: comment,
         
          islike: false));
      emit(CommentsLoaded());
    } on Exception catch (e) {
      emit(CommentsError(error: e.toString()));
    }
  }

  allComment() {
    AllComment(getIt.get<CommentReopsitoryImpli>()).call().then((data) {
      emit(FatchComments(comments: data));
    }).catchError((e) {
      emit(CommentsError(error: e.toString()));
    });
  }
  
}
