import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginBloc.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentForgotPassword extends StatelessWidget {
  const ComponentForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(OnForgotPasswordEvent());
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.grey_002,
                            fontSize: 16.0),
                      ));
                },
              ));
  }
}