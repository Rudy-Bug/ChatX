import 'package:chatting/presentation/modules/loginPage/widgets/component_buttonLogin.dart';
import 'package:chatting/presentation/modules/loginPage/widgets/component_cardViewLogin.dart';
import 'package:chatting/presentation/modules/loginPage/widgets/component_elementForLogin.dart';
import 'package:chatting/presentation/modules/loginPage/widgets/component_forgotPassword.dart';
import 'package:chatting/presentation/modules/loginPage/widgets/custome_thincknessLine.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              ComponentCard(
                // about [email and password in login bloc ]
                loginEmailController: loginEmailController,
                loginPasswordController: loginPasswordController,
              ),
              ComponentButtonLogn(
                // about [login button in bloc]
                loginEmailController: loginEmailController,
                loginPasswordController: loginPasswordController,
              ),
            ],
          ),
          const ComponentForgotPassword(),
          const CustomeThicknessLine(),
          const ComponentElementLogin(),
        ],
      ),
    );
  }
}
