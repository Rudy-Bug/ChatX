import 'package:chatting/core/routes/pages.dart';
import 'package:chatting/core/routes/routes.dart';

import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/presentation/global/AppScreen/modulesBloc/authentication/authenBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


void main()  {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  late final AuthenticationRes _authenticationRes;

  @override
  void initState() {
    super.initState();
    _authenticationRes = AuthenticationRes();
  }
  @override
  void dispose() {
      _authenticationRes.dispose() ;  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRes,
      child: BlocProvider(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.root,
            // initialRoute: Routes.splash,  ==> default
            getPages: AppPages.pages,
          ),
          create: (_) =>
              AuthenticateBloc(authenticationRes: _authenticationRes)),
    );
  }
}
