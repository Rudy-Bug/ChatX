import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/forgotPassPage/widgets/component_forgotPasswordCodeConfirm.dart';
import 'package:chatting/presentation/modules/forgotPassPage/widgets/component_forgotPasswordEmail.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final PageController _pageController = PageController();
  double _scale = 1.2;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      height: 350 * _scale,
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          print("On change?");
          _scale = index == 0 ? 0.8 : 1.2;
          print("He so: $_scale");
        },
        children:const [
                ComponentForgotPasswordEmail() , 
           ComponentForgotPasswordCodeConfirm(), 
        ],
      ),
    );
  }

  Widget _buildPage1(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(40),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const Text(
                "Did you forgot password?",
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
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      size: 25,
                    ),
                    hintText: "Type your email",
                  ),
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

