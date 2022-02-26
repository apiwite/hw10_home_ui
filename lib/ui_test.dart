class ui_test {
  final String imguser;
  final String img;
  final String caption;
  final String userpost;
  final List<Comments> comments;
  ui_test({
    required this.imguser,
    required this.img,
    required this.caption,
    required this.userpost,
    required this.comments,
  });
}
class Comments{
  final String user;
  final String comment;
  Comments({
    required this.user,
    required this.comment,
  });
}