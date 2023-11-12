import 'package:chatting/core/themes/constantColor.dart';
import 'package:flutter/material.dart';

class ComponentForgotPasswordCodeConfirm extends StatelessWidget {
  const ComponentForgotPasswordCodeConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(40),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                "Alright!",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Type code and new password!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.code_sharp,
                        size: 25,
                      ),

                      /*  
                  icon send ,  
                  icon check ,  
                  loading
              */
                      hintText: "Type your code",
                      suffixIcon:
                          IconButton(onPressed: () {}, icon: Icon(Icons.send))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: AppColors.whiteMint_21,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'WorkSansBold'),
                      ),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ));
  }
}
