import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordBloc.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordState.dart';
import 'package:chatting/presentation/modules/forgotPassPage/widgets/component_forgotPasswordCodeConfirm.dart';
import 'package:chatting/presentation/modules/forgotPassPage/widgets/component_forgotPasswordEmail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPage();
  }
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final PageController _pageController = PageController();
  double _scale = 0.8;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.isInputCode == true) {
          _pageController.animateToPage(1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate);
             
          setState(() {
            _scale = 1.2;
          });
                Get.snackbar(
                    "Code confirm: 0000",
                    "Enter this code into below to authenticated account!",
                    snackPosition: SnackPosition.TOP, // Vị trí của banner
                    backgroundColor: AppColors.blackTransfer, // Màu nền của banner
                    colorText: Colors.white, // Màu văn bản
                    duration:const Duration(seconds: 5)
                  );
        }
        if(state.newPasswordConfirm == "OK")
        {
           Get.snackbar(
                    "Change password successful",
                    "Login adn enjoy moment",
                    snackPosition: SnackPosition.TOP, // Vị trí của banner
                    backgroundColor: AppColors.blackTransfer, // Màu nền của banner
                    colorText: Colors.white, // Màu văn bản
                    duration:const Duration(seconds: 5)
                  );
            Navigator.of(context).pop();  
        }
      },
      child: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: 350 * _scale,
        duration: const Duration(milliseconds: 600),
        curve: Curves.ease,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {},
          children: [
            ComponentForgotPasswordEmail(),
            ComponentForgotPasswordCodeConfirm(),
          ],
        ),
      ),
    );
  }
}
