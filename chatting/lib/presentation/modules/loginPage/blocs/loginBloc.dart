import 'dart:async';

import 'package:chatting/data/models/model.dart';
import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/data/repository/userRepoImplement.dart';

import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      {required AuthenticationRes authenticationRes,
      required ProcessLogin loginProcessBloc})
      : _authenRes = authenticationRes,
        _loginProcess = loginProcessBloc,
        userService = UserService(),
        super(const LoginState()) {
    on<OnEmailInputEvent>(_onEmailChanged);
    on<OnPasswordInputEvent>(_onPasswordChanged);
    on<OnForgotPasswordEvent>(_onForgotPassword);
    on<OnSubmitted>(_onSubmitted);
  }

  final AuthenticationRes _authenRes;
  final ProcessLogin _loginProcess;
  final UserService userService;
  void _onEmailChanged(OnEmailInputEvent event, Emitter<LoginState> emit) {
    var email = event.email;
    emit(state.copyWith(
        email: email,
        isValid: (state.password == "" || email == "") ? false : true));
  }

  void _onForgotPassword(
      OnForgotPasswordEvent event, Emitter<LoginState> emit) {
    _loginProcess.forgotPasswordProcess();
    emit(state.copyWith(
        status: FormzSubmissionStatus.initial,
        isValid: false,
        email: "",
        password: ""));
  }

  void _onPasswordChanged(
      OnPasswordInputEvent event, Emitter<LoginState> emit) {
    var password = event.password;
    emit(state.copyWith(
        password: password,
        isValid: (state.email == "" || password == "") ? false : true));
  }

  Future<void> _onSubmitted(OnSubmitted event, Emitter<LoginState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      ReponseModel userDevice;
    
       userDevice = await userService.signIn(event.cl1.text, event.cl2.text);

      int value = userDevice.statusCode;
      print("Status code: ${value}");
      if (value == 200) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
        _authenRes.login();
      }
      if (value == 404) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure, isValid: false));
        event.cl1.clear();
        event.cl2.clear();
        Future.delayed(Duration(microseconds: 500), () {
              state.resetFailure() ;  
        });
      }
    }
  }
}
