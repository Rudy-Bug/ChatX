import 'package:chatting/core/service/saveToJson.dart';
import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimplyInformationWidget extends StatelessWidget {
   SimplyInformationWidget({super.key});
  String fileName = "yourUser.json"; 
         late   SaveToJson saveToJson =  SaveToJson();
  @override
  Widget build(BuildContext context) {
            saveToJson.readJson(fileName);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      height: MediaQuery.of(context).size.width / 10 * 2.4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            padding: const EdgeInsets.all(2),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/img/avatar/avatar1.jpg'),
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
              const Text(
                "Minh Hiếu",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 3,) ,
              const Text("id:0000", style: TextStyle(fontSize: 16)),
              Expanded(child: Container()),
            ],
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: AppColors.blueLight_02),
            child: const Icon(
              Icons.settings,
              size: 28,
              color: AppColors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 22, 0),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                shape: BoxShape.rectangle,
                color: AppColors.blueLight_02),
            child: const Icon(
              Icons.notifications,
              size: 28,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
