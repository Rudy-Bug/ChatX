import 'dart:ffi';

import 'package:chatting/core/routes/routes.dart';
import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/presentation/global/AppScreen/loadingScreen.dart';
import 'package:chatting/presentation/modules/forgotPassPage/screen/forgotPage.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginBloc.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessBloc.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessState.dart';
import 'package:chatting/presentation/modules/loginScreen/widgets/backGroundWidget.dart';
import 'package:chatting/presentation/modules/loginScreen/widgets/loginTemplateWidget.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  late final ProcessLogin _processLoginValue;

  @override
  void initState() {
    super.initState();
    _processLoginValue = ProcessLogin();
  }

  @override
  void dispose() {
    _processLoginValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
     return   Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
        body:  Stack(children: [
                BackGround_widget(),
                LoginTemPlate_Widget(),
            ]),
        ) ;
   */

    return RepositoryProvider.value(
      value: _processLoginValue,
      child: BlocProvider(
          create: (context) =>
              LoginProcessBloc(processLogin: _processLoginValue),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: ((context) {
                return LoginBloc(
                    authenticationRes:
                        RepositoryProvider.of<AuthenticationRes>(context),
                    loginProcessBloc:
                        RepositoryProvider.of<ProcessLogin>(context));
              })),
              BlocProvider(create: ((context) {
                return RegisteringBloc(
                    processLogin: RepositoryProvider.of<ProcessLogin>(context));
              })),
            ],
            child: MaterialApp(
              builder: (context, child) {
                return BlocListener<LoginProcessBloc, ProcessLoginState>(
                  listener: (context, state) {
                    switch (state.status) {
                      case ProcessLoginStatus.login:
                        if (LoginProcessBloc.pageController != null) {
                          LoginProcessBloc.pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate);
                        }
                        // Get.toNamed(Routes.loading) ;
                        break;
                      case ProcessLoginStatus.forgot:
                      print("I forgot password?"); 
                        showModalBottomSheet(context: context, builder:(context) {
                            return ForgotPasswordPage() ; 
                        },) ;  
                        break;
                      case ProcessLoginStatus.registering:
                        print("Into registing?");

                        break;
                      case ProcessLoginStatus.renewPass:
                        break;
                    }
                  },
                  child: const Scaffold(
                    resizeToAvoidBottomInset: true,
                    backgroundColor: Colors.white,
                    body: Stack(children: [
                      BackGround_widget(),
                      LoginTemPlate_Widget(),
                    ]),
                  ),
                );
              },
              onGenerateRoute: (settings) => LoadingScreen.route(),
            ),
          )),
    );
  }
}
