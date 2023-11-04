// ignore: file_names
import 'package:flutter/material.dart';


import 'package:flutter/cupertino.dart';

class AppColors{
  static const Color greenLight_01 =  Color.fromARGB(255, 73, 219, 132) ;  
  static const Color blueLight_01 =  Color.fromARGB(255, 114, 179, 211) ;  
  static const Color whitePupble =  Color.fromARGB(255, 202, 191, 212) ; 
  static const Color blackKa =    Color.fromARGB(255, 33, 6, 58) ;  
  static const Color whiteGrey_01 =  Color.fromARGB(255, 220, 217, 217) ;  
  static const Color whiteBlue_21 =  Color.fromARGB(255, 52, 138, 199) ;  
  static const Color whiteMint_21 =  Color.fromARGB(255, 52, 226, 226)  ;

   static  LinearGradient linearStandard = const LinearGradient(
    colors: <Color>[whiteBlue_21, whiteMint_21],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}