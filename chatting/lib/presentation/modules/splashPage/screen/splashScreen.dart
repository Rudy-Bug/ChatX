import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.blueLight_01,
              AppColors.greenLight_01,
            ],
          )),
          child: const Center(
            child: Icon(
              Icons.cabin,
              size: 45,
              color: AppColors.blackKa,
            ),
          )),
    );
  }
}
