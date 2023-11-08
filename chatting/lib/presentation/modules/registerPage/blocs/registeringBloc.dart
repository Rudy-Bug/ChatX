import 'package:chatting/data/models/model.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/data/repository/userRepoImplement.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/presentation/modules/forgotPassPage/blocs/forgotPasswordState.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringEvent.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RegisteringBloc extends Bloc<RegisteringEvent, RegisteringState> {
  RegisteringBloc({required ProcessLogin processLogin})
      : _processLogin = processLogin,
        userService = UserService(),
        super(const RegisteringState()) {
    on<OnInputName>(_onInputName);
    on<OnInputPasswordConfirm>(_onInputConfirmPassword);
    on<OnInputEmail>(_onInputEmail);
    on<OnInputPassword>(_onInputPassword);
    on<OnSubmittedRegistering>(_onSubbmitedRegistering);
    on<OnResetRegisteringPage>(_onResetRegisteringPage);
  }

  final ProcessLogin _processLogin;
  final UserService userService;

  void _onInputName(OnInputName evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        name: evet.name,
        isValid: (state.email == '' ||
                state.password == '' ||
                state.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  void _onResetRegisteringPage(
      OnResetRegisteringPage event, Emitter<RegisteringState> emit) {
        emit(state.resetRegistering());
      }

  void _onInputConfirmPassword(
      OnInputPasswordConfirm evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        password: evet.passwordConfirm,
        isValid: (state.email == '' ||
                state.password == '' ||
                state.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  void _onInputEmail(OnInputEmail evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        email: evet.email,
        isValid: (state.email == '' ||
                state.password == '' ||
                state.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  void _onInputPassword(OnInputPassword evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        password: evet.password,
        isValid: (state.email == '' ||
                state.password == '' ||
                state.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  Future<void> _onSubbmitedRegistering(
      OnSubmittedRegistering event, Emitter<RegisteringState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        User userRegistering = User(
            name: state.name, password: state.password, email: state.email);
        ReponseModel value = await userService.registeringUser(userRegistering);
        if (value.statusCode == 200) {
          emit(state.resetRegistering());
          _processLogin.loginProcess() ; 
        } else {
          event.removeText();
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure, mess: value.message));
        }
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
