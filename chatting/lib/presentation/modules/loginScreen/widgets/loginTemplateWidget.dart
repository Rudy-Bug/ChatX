import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/global/utils/bubble_indicator_painter.dart';
import 'package:chatting/presentation/modules/loginScreen/widgets/signIn.dart';
import 'package:chatting/presentation/modules/loginScreen/widgets/signUp.dart';
import 'package:flutter/material.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height:
                      MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                    child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (index) {
                    FocusScope.of(context).requestFocus(FocusNode()) ;
                    if(index == 0) {
                      setState(() {
                        rightPage = Colors.white ;  
                        leftPage = Colors.black ; 
                      });
                    }else if (index == 1) {
                      setState(() {
                         rightPage = Colors.black ;  
                        leftPage = Colors.white ; 
                      });
                    }
                  },
                  children: [
                      ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child:  const SignIn(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child:  SignUp(),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        // painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Existing',
                  style: TextStyle(
                    color: leftPage,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'New',
                  style: TextStyle(
                    color: rightPage,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
