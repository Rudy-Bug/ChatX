// ignore: file_names
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class AppColors {
  static const Color greenLight_02 = Color.fromARGB(255, 73, 219, 132);
  static const Color greenLight_01 = Color.fromARGB(255, 116, 204, 151);
  static const Color white = Color.fromARGB(255, 250, 250, 250);
  static const Color blueLight_01 = Color.fromARGB(255, 114, 179, 211);
  static const Color blueLight_02 = Color.fromARGB(255, 33, 136, 187);
  static const Color whitePupble = Color.fromARGB(255, 202, 191, 212);
  static const Color blackKa = Color.fromARGB(255, 33, 6, 58);
  static const Color blackTransfer = Color.fromARGB(80, 70, 65, 65);
  static const Color whiteGrey_01 = Color.fromARGB(255, 220, 217, 217);
  static const Color whiteBlue_21 = Color.fromARGB(255, 52, 138, 199);
  static const Color whiteMint_21 = Color.fromARGB(255, 14, 190, 190);
  static const Color whiteMint_22 = Color.fromARGB(255, 236, 255, 255);
  static const Color grey_001 = Color.fromARGB(255, 190, 204, 204);
  static const Color grey_002 = Color.fromARGB(255, 62, 78, 78);
  static const Color black_001 = Color.fromARGB(255, 24, 26, 26);
  static const Color mintBlue_001 = Color.fromARGB(255, 163, 247, 247);
  static const Color snackBarColors = Color.fromARGB(100, 50, 54, 54);

  // <-------- session for capacity type ---> 
  static const Color whiteGrey_01_capacity = Color.fromARGB(80, 220, 217, 217);
  static const Color blackTransfer_capacity = Color.fromARGB(255, 220, 217, 217);


  static LinearGradient linearStandard = const LinearGradient(
      colors: <Color>[whiteBlue_21, whiteMint_21],
      begin: FractionalOffset(0.2, 0.2),
      end: FractionalOffset(1.0, 1.0),
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp);

    static LinearGradient buttonAssign = const LinearGradient(
      colors: <Color>[whiteBlue_21, whiteMint_21],
      begin: FractionalOffset(0.2, 0.2),
      end: FractionalOffset(1.0, 1.0),
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp);

        static LinearGradient buttonUnassign =  const LinearGradient(
      colors: <Color>[whiteBlue_21, whiteMint_21],
      begin: FractionalOffset(0.2, 0.2),
      end: FractionalOffset(1.0, 1.0),
      stops: <double>[0.0, 1.0],
      tileMode: TileMode.clamp);
}
