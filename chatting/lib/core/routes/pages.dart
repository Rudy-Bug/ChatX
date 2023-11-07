import 'package:chatting/core/routes/routes.dart';
import 'package:chatting/presentation/global/AppScreen/AppScreen.dart';
import 'package:chatting/presentation/global/AppScreen/loadingScreen.dart';
import 'package:chatting/presentation/modules/homeScreen/screen/homeScreen.dart';
import 'package:chatting/presentation/modules/loginScreen/screen/loginScreen.dart';
import 'package:chatting/presentation/modules/splashPage/screen/splashScreen.dart';
import 'package:get/route_manager.dart';

abstract class  AppPages{
    static final List<GetPage> pages =  [
       GetPage(page: () => const SplashScreen(), name: Routes.splash  ) , 
       GetPage(page: () => const LoginScreen(), name: Routes.login  ) , 
       GetPage(page: () => const AppScreen(), name: Routes.root  ) , 
       GetPage(page: () => const LoadingScreen(), name: Routes.loading  ) , 
       GetPage(page: () => const HomeScreen(), name: Routes.home  ) , 
      //  GetPage(page: () => const LoginScreen(), name: Routes.login  ) , 
    ] ;  
}

