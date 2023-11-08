import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ComponentElementLogin extends StatelessWidget {
  const ComponentElementLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 40.0),
          child: GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "This sevice is maintained",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.snackBarColors,
                  textColor: AppColors.white,
                  fontSize: 16.0);
            },
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
            onTap: () {
              Fluttertoast.showToast(
                  msg: "This sevice is maintained",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.snackBarColors,
                  textColor: AppColors.white,
                  fontSize: 16.0);
            },
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
    );
  }
}
