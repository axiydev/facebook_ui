class PostModel {
  final String username;
  final String userImage;
  final String datetime;
  final String comment;
  final bool isVIP;
  final String location;
  final List<String> imageList;

  const PostModel(
      {required this.comment,
      required this.datetime,
      required this.userImage,
      required this.isVIP,
      required this.imageList,
      required this.location,
      required this.username});
}
