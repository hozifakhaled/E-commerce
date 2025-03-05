class CommentEntity {
 
  final int like;
  final String email;
  final String comment;
  final bool islike;

  CommentEntity( {required this.islike, 
  
      required this.like,
      required this.email,
      required this.comment});
}
