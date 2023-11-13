import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordBloc.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordEvent.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
class ComponentForgotPasswordEmail extends StatelessWidget {
  ComponentForgotPasswordEmail({super.key});

  final TextEditingController emailEdittingController = TextEditingController();

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
                  child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                    builder: (context, state) {
                      return TextField(
                        controller: emailEdittingController,
                        onChanged: (email) {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(OnInputYourEmail(email: email));
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            size: 25,
                          ),
                          hintText: "Type your email",
                        ),
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(0),
                child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(top: 25.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        gradient: LinearGradient(
                            colors: state.isValid
                                ? <Color>[
                                    AppColors.blueLight_01,
                                    AppColors.whiteMint_21
                                  ]
                                : <Color>[
                                    AppColors.grey_001,
                                    AppColors.grey_002
                                  ],
                            begin: const FractionalOffset(0.2, 0.2),
                            end: const FractionalOffset(1.0, 1.0),
                            stops: const <double>[0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: MaterialButton(
                          highlightColor: Colors.transparent,
                          splashColor: state.isValid
                              ? AppColors.whiteMint_21
                              : AppColors.blackKa,
                          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                          child: state.status.isInProgress
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 42.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 42.0),
                                  child: state.isValid
                                      ? const Text(
                                          "Confirm",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.0,
                                              fontFamily: 'WorkSansBold'),
                                        )
                                      : const Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 26.0,
                                              fontFamily: 'WorkSansBold'),
                                        )),
                          onPressed: () {
                              
                            if (state.isValid) {
                              context.read<ForgotPasswordBloc>().add(
                                  OnSubmittedEmail(
                                      emailController:
                                          emailEdittingController));
                           
                            } else {
                              context
                                  .read<ForgotPasswordBloc>()
                                  .add(OnCancelForgotPassword());
                              Navigator.of(context).pop();
                            }
                          }),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
