import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginBloc.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:chatting/presentation/modules/loginPage/screen/signIn.dart';
import 'package:chatting/presentation/modules/registerPage/screen/signUp.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessBloc.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessEvent.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessState.dart';
import 'package:chatting/presentation/modules/loginScreen/widgets/bubbleMenuBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

// ignore: camel_case_types
class LoginTemPlate_Widget extends StatefulWidget {
  const LoginTemPlate_Widget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginTemPlate_Widget();
  }
}

// ignore: camel_case_types
class _LoginTemPlate_Widget extends State<LoginTemPlate_Widget>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  Color leftPage = Colors.black;
  Color rightPage = Colors.white;
  @override
  void initState() {
    _pageController = PageController();
    context
        .read<LoginProcessBloc>()
        .add(StatusChangedLoginProcess(ProcessLoginStatus.login));
    LoginProcessBloc.pageController =  _pageController ;  

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height > 800
                          ? 191.0
                          : 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: BubbleMenubar(
                        pageController: _pageController,
                      ),
                    ),
                    Expanded(
                        child: BlocBuilder<LoginProcessBloc, ProcessLoginState>(
                      builder: (context, state) {
                        return PageView(
                          controller: _pageController,
                          physics: const ClampingScrollPhysics(),
                          onPageChanged: (index) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (index == 0) {
                              context.read<LoginProcessBloc>().add(
                                  StatusChangedLoginProcess(
                                      ProcessLoginStatus.login));
                            } else if (index == 1) {
                              context.read<LoginProcessBloc>().add(
                                  StatusChangedLoginProcess(
                                      ProcessLoginStatus.registering));
                            }
                          },
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints.expand(),
                              child: const SignIn(),
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints.expand(),
                              child: const SignUp(),
                            ),
                          ],
                        );
                      },
                    ))
                  ],
                )),
          ) ;  
  }
}

/*
 

*/