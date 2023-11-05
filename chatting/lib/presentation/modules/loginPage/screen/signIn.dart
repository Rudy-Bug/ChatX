import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginBloc.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool _obscureTextPassword = true;
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
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
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
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
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
                                  context.read<LoginBloc>().add(
                                      OnPasswordInputEvent(
                                          password: passwordText));
                                },
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
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
              ),
              Container(
                  margin: const EdgeInsets.only(top: 170.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppColors.blueLight_01,
                        offset: Offset(1.0, 3.0),
                        blurRadius: 8.0,
                      ),
                      BoxShadow(
                        color: AppColors.whiteMint_21,
                        offset: Offset(1.0, 3.0),
                        blurRadius: 8.0,
                      ),
                    ],
                    gradient: LinearGradient(
                        colors: <Color>[
                          AppColors.blueLight_01,
                          AppColors.whiteMint_21
                        ],
                        begin: FractionalOffset(0.2, 0.2),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: BlocBuilder<LoginBloc, LoginState>(
                    
                    builder: (context, state) {
                      if (state.status.isInProgress) {
                        Container(
                            padding:const EdgeInsets.all(20),
                            child:const Center(
                                child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: AppColors.blueLight_02,
                                    ))));
                      }
                      return MaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: AppColors.whiteMint_21,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.read<LoginBloc>().add(OnSubmitted(
                              cl1: loginEmailController,
                              cl2: loginPasswordController));
                        },
                      );
                    },
                  ))
            ],
          ),
          Padding(
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
                            color: AppColors.grey_001,
                            fontSize: 16.0),
                      ));
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          AppColors.grey_001,
                          AppColors.black_001,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      color: AppColors.grey_001,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[
                          AppColors.black_001,
                          AppColors.grey_001,
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 1.0),
                        stops: <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 40.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.facebook,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.transfer_within_a_station_rounded,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
