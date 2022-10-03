class MessageModel {
  String? userImage;
  String? message;
  DateTime? sendAt;
  bool? isMyMessage;
  MessageModel(
      {required this.message,
      required this.sendAt,
      required this.isMyMessage,
      required this.userImage});
}
