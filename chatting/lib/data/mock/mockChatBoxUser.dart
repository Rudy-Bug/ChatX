import 'package:chatting/domain/entities/modalChatBoxUser.dart';

class MocChatBoxUser {
  static List<ModalUserChatBox> mockChatBoxUser = [
    ModalUserChatBox(imageUrl: "2", textBundle: "Ê đi ăn bún bò không fen?",  time: "8:30" , userName: "Minh Phan" , isYoursText: false),
    ModalUserChatBox(imageUrl: "4", textBundle: "You: Happy Birthday Quyen",  time: "21:11" , userName: "Anh Nhật" , isYoursText: true),
    ModalUserChatBox(imageUrl: "5", textBundle: "You: Lô anh,600k em muốn...",  time: "16:08" , userName: "Lê Anh Nuôi" , isYoursText: false),
  ];
}