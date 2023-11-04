import 'package:chatting/core/routes/routes.dart';
import 'package:chatting/presentation/global/AppScreen/AppScreen.dart';
import 'package:chatting/presentation/modules/loginScreen/screen/loginScreen.dart';
import 'package:chatting/presentation/modules/splashPage/screen/splashScreen.dart';
import 'package:get/route_manager.dart';

abstract class AppPages{
    static final List<GetPage> pages =  [
       GetPage(page: () => const SplashScreen(), name: Routes.splash  ) , 
       GetPage(page: () => const LoginScreen(), name: Routes.login  ) , 
       GetPage(page: () =>  AppScreen(), name: Routes.root  ) , 
       GetPage(page: () =>  AppScreen(), name: Routes.loading  ) , 
      //  GetPage(page: () => const LoginScreen(), name: Routes.login  ) , 
    ] ;  
}

