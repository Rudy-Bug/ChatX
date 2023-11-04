import 'package:chatting/presentation/modules/loginPage/widgets/backGroundWidget.dart';
import 'package:chatting/presentation/modules/loginPage/widgets/loginTemplateWidget.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
   return _LoginScreen() ;  
  }

}

class _LoginScreen extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
   return const  Scaffold(
    backgroundColor: Colors.white,
      body:  Stack(children: [
              BackGround_widget(),  
              LoginTemPlate_Widget(), 
          ]),
      ) ;  
  }

}