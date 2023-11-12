import 'package:chatting/data/models/model.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/data/repository/userRepoImplement.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordEvent.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordState.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ProcessLogin _processLogin;
  final UserService userService;

  ForgotPasswordBloc({required ProcessLogin processLogin})
      : _processLogin = processLogin,
        userService = UserService(),
        super(const ForgotPasswordState()) {}

  void _onInputEmail(
      OnInputYourEmail event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
        email: event.email,
        isValid:
            (state.email.length > 5 && state.codeMock == '') ? true : false));
  }

  void _onCancelForgotPassword(
      OnCancelForgotPassword event, Emitter<ForgotPasswordState> emit) {
    emit(state.resetForgotPassword());
    _processLogin.loginProcess(); // Để tạm, logic sai!
  }

  Future<void> _onSubmitedEmail(
      OnSubmittedEmail event, Emitter<ForgotPasswordState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
          late ReponseModel value;
          String emailConfirm = state.email ;  
          print("Email push service forgotpassword: ${emailConfirm}") ;  
          await Future.delayed(const Duration(seconds: 2), () async {
            value = await userService.getPassword(emailConfirm);
          });
          if (value.statusCode == 200) {
            event.removeText();
            emit(state.copyWith(status: FormzSubmissionStatus.success));
            _processLogin.loginProcess();
          } else {
            event.removeText();
            emit(state.copyWith(
                status: FormzSubmissionStatus.failure, mess: value.message));
        }
      } catch (_) {
        print("into here exception On Subbmited");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
