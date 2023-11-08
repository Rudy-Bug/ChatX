import 'package:chatting/presentation/modules/loginPage/blocs/loginBloc.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentCard extends StatelessWidget {
  ComponentCard(
      {super.key,
      required this.loginEmailController,
      required this.loginPasswordController});
  TextEditingController loginEmailController;
  TextEditingController loginPasswordController;
  bool _obscureTextPassword = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: SizedBox(
        width: 300.0,
        height: 190.0,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextField(
                      controller: loginEmailController,
                      onChanged: (emailText) {
                        context
                            .read<LoginBloc>()
                            .add(OnEmailInputEvent(email: emailText));
                      },
                      keyboardType: TextInputType.emailAddress,
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 25.0,
                        ),
                        hintText: 'Email Address',
                        hintStyle: TextStyle(fontSize: 17.0),
                      ),
                    );
                  },
                )),
            Container(
              width: 250.0,
              height: 1.0,
              color: Colors.grey[400],
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextField(
                      controller: loginPasswordController,
                      obscureText: _obscureTextPassword,
                      onChanged: (passwordText) {
                        context
                            .read<LoginBloc>()
                            .add(OnPasswordInputEvent(password: passwordText));
                      },
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(
                          Icons.lock,
                          size: 22.0,
                          color: Colors.black,
                        ),
                        hintText: 'Password',
                        hintStyle: const TextStyle(fontSize: 17.0),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            _obscureTextPassword
                                ? Icons.remove_red_eye
                                : Icons.elderly,
                            size: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.go,
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
