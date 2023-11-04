import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/presentation/global/utils/bubble_indicator_painter.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessBloc.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessEvent.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BubbleMenubar extends StatefulWidget {
  final PageController pageController;
  const BubbleMenubar({super.key, required this.pageController});
  @override
  State<StatefulWidget> createState() {
    return _BubbleMenubar();
  }
}

class _BubbleMenubar extends State<BubbleMenubar> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = widget.pageController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.0,
        height: 50.0,
        decoration: const BoxDecoration(
          color: Color(0x552B2B2B),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        child: BlocBuilder<LoginProcessBloc, ProcessLoginState>(
          builder: (context, state) {
            return CustomPaint(
              painter: BubbleIndicatorPainter(pageController: _pageController),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        context.read<LoginProcessBloc>().add(
                            StatusChangedLoginProcess(
                                ProcessLoginStatus.login));
                        _pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Text(
                        'Existing',
                        style: TextStyle(
                          color: state.isSignUp ? Colors.white : Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  //Container(height: 33.0, width: 1.0, color: Colors.white),
                  Expanded(
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        context.read<LoginProcessBloc>().add(
                            StatusChangedLoginProcess(
                                ProcessLoginStatus.registering));
                        _pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate);
                      },
                      child: Text(
                        'New',
                        style: TextStyle(
                          color: state.isSignUp ? Colors.black : Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }


}
