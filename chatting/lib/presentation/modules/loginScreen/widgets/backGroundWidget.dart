import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackGround_widget extends StatelessWidget {
  const BackGround_widget({super.key});

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.sizeOf(context).height;
    double widthScreen = MediaQuery.sizeOf(context).width;
    return Container(
      height: heightScreen,
      width: widthScreen,
      color: AppColors.whiteGrey_01, 
      child: Image.asset('assets/img/background_login.jpg',fit: BoxFit.fill,)
    );
  }
}
