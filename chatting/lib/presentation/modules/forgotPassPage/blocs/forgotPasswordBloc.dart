import 'package:chatting/data/models/model.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/data/repository/userRepoImplement.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordEvent.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordState.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ProcessLogin _processLogin;
  final UserService userService;
  String passwordBrycpt = "";
  ForgotPasswordBloc({required ProcessLogin processLogin})
      : _processLogin = processLogin,
        userService = UserService(),
        super(const ForgotPasswordState()) {
    on<OnCancelForgotPassword>(_onCancelForgotPassword);
    on<OnSubbmitedNewPassword>(_onSubmitedNewConfirmPassword);
    on<OnConfirmCode>(_onSubmitedCode);
    on<OnSubmittedEmail>(_onSubmitedEmail);
    on<OnInputCodeMock>(_onInputCodeMock);
    on<OnInputNewPassword>(_onInputNewPassword);
    on<OnInputYourEmail>(_onInputEmail);
  }

  void _onInputEmail(
      OnInputYourEmail event, Emitter<ForgotPasswordState> emit) {
    print("Cai gi do dc nhap" + event.email);
    emit(state.copyWith(
        email: event.email,
        isValid:
            (state.email.length > 3 && state.codeMock == '') ? true : false));
  }

  void _onInputCodeMock(
      OnInputCodeMock event, Emitter<ForgotPasswordState> emit) {
    String code = event.codeMock;
    emit(state.copyWith(codeMock: code, isInputCode: false));
  }

  void _onInputNewPassword(
      OnInputNewPassword event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(
      newPasswordConfirm: event.newPassword,
    ));
  }

  void _onCancelForgotPassword(
      OnCancelForgotPassword event, Emitter<ForgotPasswordState> emit) {
    emit(state.resetForgotPassword());
    print("Into here?");
    _processLogin.loginProcess(); // Để tạm, logic sai!
  }

  Future<void> _onSubmitedEmail(
      OnSubmittedEmail event, Emitter<ForgotPasswordState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        late ReponseModel value;
        String emailConfirm = state.email;
        print("Email push service forgotpassword: ${emailConfirm}");
        await Future.delayed(const Duration(seconds: 2), () async {
          value = await userService.getPassword(emailConfirm);
          passwordBrycpt = value.model as String;
          print(passwordBrycpt);
        });
        if (value.statusCode == 200) {
          event.removeText();
          emit(state.copyWith(
              isInputCode: true, status: FormzSubmissionStatus.initial));
        } else {
          event.removeText();
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure, mess: value.message));
        }
      } catch (_) {
        print("into here exception On Subbmited ForgotPassword");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  Future<void> _onSubmitedCode(
      OnConfirmCode event, Emitter<ForgotPasswordState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await Future.delayed(const Duration(seconds: 2));
        emit(state.copyWith(
            status: FormzSubmissionStatus.success, isRenewpassword: true));
      } catch (_) {
        print("into here exception On Subbmited ForgotPassword submitted Code");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  // 1 số thỏa thuận về case FormzSubmissionStatus trong use case này:
  // initital và inporogress và success?
  // success dùng trong confirm code cho phép hiện dấu tick và lắng nghe hiện thị button?

  Future<void> _onSubmitedNewConfirmPassword(
      // chưa làm API :v
      OnSubbmitedNewPassword event,
      Emitter<ForgotPasswordState> emit) async {
    try {
    ReponseModel reponse =  await userService.changePassword(
          User(email: state.email, password: passwordBrycpt),
          state.newPasswordConfirm);
        if(reponse.statusCode == 200)
        {
          emit(state.copyWith(newPasswordConfirm: "OK")); 
          _processLogin.loginProcess() ;  
        }
    } catch (_) {
       print("into here exception On Subbmited ForgotPassword submitted Code");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
