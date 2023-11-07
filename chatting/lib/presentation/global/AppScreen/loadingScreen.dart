import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoadingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.mintBlue_001,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.blackKa),
        ),
      ),
    );
  }
}
