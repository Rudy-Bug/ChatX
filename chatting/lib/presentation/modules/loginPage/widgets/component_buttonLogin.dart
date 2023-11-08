import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginBloc.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:formz/formz.dart';

class ComponentButtonLogn extends StatelessWidget {
  ComponentButtonLogn(
      {super.key,
      required this.loginEmailController,
      required this.loginPasswordController});
  TextEditingController loginEmailController;
  TextEditingController loginPasswordController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.status.isFailure) {
          Fluttertoast.showToast(
              msg: "Something went wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: AppColors.snackBarColors,
              textColor: AppColors.white,
              fontSize: 16.0);
        }
        return Container(
          margin: const EdgeInsets.only(top: 170.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color:
                    state.isValid ? AppColors.blueLight_01 : AppColors.grey_001,
                offset: const Offset(1.0, 3.0),
                blurRadius: 8.0,
              ),
              BoxShadow(
                color:
                    state.isValid ? AppColors.whiteMint_21 : AppColors.grey_002,
                offset: const Offset(1.0, 3.0),
                blurRadius: 8.0,
              ),
            ],
            gradient: LinearGradient(
                colors: state.isValid
                    ? <Color>[AppColors.blueLight_01, AppColors.whiteMint_21]
                    : <Color>[AppColors.grey_001, AppColors.grey_002],
                begin: const FractionalOffset(0.8, 0.2),
                end: const FractionalOffset(1.0, 2),
                stops: const <double>[0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: state.isValid ? AppColors.whiteMint_21 : null,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 42.0),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.status.isInProgress
                        ? const CircularProgressIndicator(
                            strokeWidth: 4,
                            color: AppColors.white,
                          )
                        : const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          );
                  },
                )),
            onPressed: () {
              context.read<LoginBloc>().add(OnSubmitted(
                  cl1: loginEmailController, cl2: loginPasswordController));
            },
          ),
        );
      },
    );
  }
}
