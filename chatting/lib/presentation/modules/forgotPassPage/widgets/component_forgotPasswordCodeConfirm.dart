import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordBloc.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordEvent.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ComponentForgotPasswordCodeConfirm extends StatelessWidget {
  ComponentForgotPasswordCodeConfirm({super.key});

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
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                builder: (context, state) {
                  return state.status.isSuccess
                      ? Container(
                          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              TextField(
                                onChanged: (codeNumber) {
                                  context.read<ForgotPasswordBloc>().add(
                                      OnInputNewPassword(
                                          newPassword: codeNumber));
                                },
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock_clock_sharp),
                                  hintText: "New password",
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_clock_sharp),
                                  hintText: "Confirmation",
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: TextField(
                              onChanged: (codeNumber) {
                                context
                                    .read<ForgotPasswordBloc>()
                                    .add(OnInputCodeMock(codeMock: codeNumber));
                              },
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.code_sharp,
                                    color: AppColors.blueLight_01,
                                    size: 25,
                                  ),
                                  hintText: "Type your code",
                                  suffix: state.status.isInProgress
                                      ? const SizedBox(
                                          height: 15,
                                          width: 15,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            if (state.status.isInitial) {
                                              context
                                                  .read<ForgotPasswordBloc>()
                                                  .add(OnConfirmCode());
                                            }
                                          },
                                          icon: state.status.isInitial
                                              ? const Icon(
                                                  Icons.send,
                                                  color: AppColors.blueLight_01,
                                                )
                                              : const Icon(
                                                  Icons.check,
                                                  color: AppColors.blueLight_02,
                                                ))),
                            ),
                          ),
                        );
                },
              ),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                return Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    gradient: LinearGradient(
                        colors: state.isRenewpassword
                            ? <Color>[
                                AppColors.blueLight_01,
                                AppColors.whiteMint_21
                              ]
                            : <Color>[AppColors.grey_001, AppColors.grey_002],
                        begin: const FractionalOffset(0.2, 0.2),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: const <double>[0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: state.isRenewpassword
                          ? AppColors.whiteMint_21
                          : AppColors.grey_002,
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: state.isRenewpassword
                            ? const Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26.0,
                                    fontFamily: 'WorkSansBold'),
                              )
                            : const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontFamily: 'WorkSansBold'),
                              ),
                      ),
                      onPressed: () {
                        if (state.isRenewpassword == true) {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(OnSubbmitedNewPassword());
                        } else if (state.isRenewpassword == false) {
                          context
                              .read<ForgotPasswordBloc>()
                              .add(OnCancelForgotPassword());
                          Navigator.of(context).pop();
                        }
                      }),
                );
              })
            ],
          ),
        ));
  }
}
