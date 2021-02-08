class MessageModel {
  final String avatarUrl;
  final String name;
  final DateTime datetime;
  final String message;
  final bool isMine;

  MessageModel({
    this.avatarUrl,
    this.name,
    this.datetime,
    this.message,
    this.isMine,
  });
}
