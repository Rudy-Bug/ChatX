import 'package:chatting/data/mock/mockChatBoxUser.dart';
import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/homeScreen/widgets/modalChatBox.dart';
import 'package:chatting/presentation/modules/homeScreen/widgets/simplyInforPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  final listModel = MocChatBoxUser.mockChatBoxUser ;  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blueLight_01,
          child: const Icon(
            Icons.search,
            size: 28,
            color: AppColors.white,
          ),
          onPressed: () {},
        ),
        backgroundColor: AppColors.blueLight_01, // Màu mạc địh
        body: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                color: AppColors.whiteGrey_01,
                child: Image.asset(
                  'assets/img/background_home.jpg',
                  fit: BoxFit.fill,
                )),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const SimplyInformationWidget(),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    padding:const EdgeInsets.fromLTRB(0, 35, 0, 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(55),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: listModel.length,
                      itemBuilder: (context, index) {
                        return ModelChatBox(userModel: listModel[index],); 
                    }, ) ),
                ),
              ],
            ),
          ],
        ));
  }
}
