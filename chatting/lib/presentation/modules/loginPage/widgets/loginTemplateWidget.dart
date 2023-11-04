import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';

class LoginTemPlate_Widget extends StatefulWidget {
  const LoginTemPlate_Widget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginTemPlate_Widget();
  }
}

// ignore: camel_case_types
class _LoginTemPlate_Widget extends State<LoginTemPlate_Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.max,
          children: [
            
            Container(
              height:  MediaQuery.sizeOf(context).height * 40/100 ,  
              width:  MediaQuery.sizeOf(context).width * 75/100 ,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(24),
               gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.whiteBlue_21,
              AppColors.whiteMint_21,
            ],) 
              ),
            ), 
             SizedBox(
              height: MediaQuery.sizeOf(context).height * 10/100,
            ),
          ]),
      )
    );
  }
}
