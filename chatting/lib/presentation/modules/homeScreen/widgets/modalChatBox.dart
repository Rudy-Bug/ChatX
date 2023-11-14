import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/domain/entities/modalChatBoxUser.dart';
import 'package:flutter/material.dart';

class ModelChatBox extends StatelessWidget {
  ModelChatBox({super.key, required this.userModel});
  ModalUserChatBox userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.grey_001)),
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/img/avatar/avatar${userModel.imageUrl}.jpg'),
              radius: 35.0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Text(
                userModel.userName as String,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
               Text("${userModel.textBundle}",
                  style:  const TextStyle(fontSize: 16) ),
              Expanded(child: Container()),
            ],
          ),
          Expanded(child: Container()),
          Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 22, 0),
              padding: const EdgeInsets.all(4),
              child:  Text("${userModel.time}")),
        ],
      ),
    );
  }
}
