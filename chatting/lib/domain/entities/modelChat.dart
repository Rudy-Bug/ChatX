class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool select = false;
  int id;
  ChatModel(
      {required this.name,
      required this.icon,
      required this.time,
      required this.isGroup,
      required this.status,
      required this.currentMessage,
      required this.id,
      required this.select});
}

class MessageModel {
  String type;
  String message;
  MessageModel({required this.type, required this.message});
}
