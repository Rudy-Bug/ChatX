import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/core/themes/constantStyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();  
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            SizedBox(
              width: 35,
            ),
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/img/avatar/avatar01.jpg'),
            ),
            SizedBox(
              width: 35,
            ),
            Text(
              "Tom",
              style: AppStyle.textStyle_medium,
            ),
            Expanded(child: Container()),
            Icon(
              Icons.notifications,
              size: 28,
            ),
            SizedBox(
              width: 35,
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          children: [
            Container(
              color: AppColors.blueLight_01,
            ),
            Container(
              color: AppColors.greenLight_01,
            ),
          ],
        ),
        bottomNavigationBar: 
        BottomNavigationBar(
           onTap: (int index) async {
            setState(() {
              pageController.jumpToPage(index);
            });
          }, 
          items: [
            BottomNavigationBarItem(
              label: "Person",
              icon: Icon(Icons.person)),
            BottomNavigationBarItem(
              label: "Group",
              icon: Icon(Icons.group))
          ],
        ));
  }
}
