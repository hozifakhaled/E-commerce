// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());
}
