import 'dart:async';

import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessEvent.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginProcessBloc extends Bloc<LoginProcesEvent, ProcessLoginState> {
  LoginProcessBloc({required ProcessLogin processLogin })
      : _processLogin = processLogin,  
        super(const ProcessLoginState.login()) {
    on<StatusChangedLoginProcess>(_onStatusChangedLoginProcess);
    on<StatusReturnLoginProcess>(_onStatusReturnLoginProcess);
    _controllerStreamLoginProcess = _processLogin.status.listen((event) => add(StatusChangedLoginProcess(event)) ) ;  
  }
  final ProcessLogin _processLogin;

  late StreamSubscription<ProcessLoginStatus> _controllerStreamLoginProcess;

  Future<void> close() {
    _controllerStreamLoginProcess.cancel();
    return super.close();
  }

  Future<void> _onStatusChangedLoginProcess(
      StatusChangedLoginProcess event, Emitter<ProcessLoginState> emit) async {
          switch (event.status) {
      case ProcessLoginStatus.login:
        emit(const ProcessLoginState.login());
      case ProcessLoginStatus.registering:
        emit(const ProcessLoginState.registering());
      case ProcessLoginStatus.renewPass:
        emit(const ProcessLoginState.renewPass());
      case ProcessLoginStatus.forgot:
        emit(const ProcessLoginState.forgotPassword());
    }
      }
    
    void _onStatusReturnLoginProcess(StatusReturnLoginProcess event , Emitter<ProcessLoginState> emit) {
      _processLogin.loginProcess() ;  
    }
}
