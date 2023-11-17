import 'package:chatting/core/routes/routes.dart';
import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/presentation/global/AppScreen/modulesBloc/authentication/authenBloc.dart';
import 'package:chatting/presentation/global/AppScreen/modulesBloc/authentication/authenState.dart';
import 'package:chatting/presentation/modules/splashPage/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AppScreen extends StatefulWidget{
  const AppScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppScreen() ;  
  }

}

class _AppScreen extends State<AppScreen>{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(builder: (context, child)  {
      return BlocListener<AuthenticateBloc, AuthenticateState>(listener:(context, state) {
        switch(state.status)
        {
          case AuthenticationStatus.unknown:
          break ; 
          case AuthenticationStatus.unauthenticated:
          Get.toNamed( Routes.login) ; 
          // Get.toNamed( Routes.home) ; 
          break ; // dispose all page before stack :v
          case AuthenticationStatus.authenticated:
          Get.offAndToNamed(Routes.home) ; 
          print("Hello world?") ; 
          break ;  
        }
      },
      child: child,
      ) ;
    } , 
    onGenerateRoute: (settings) => SplashScreen.route(),
    ) ; 
  }

}