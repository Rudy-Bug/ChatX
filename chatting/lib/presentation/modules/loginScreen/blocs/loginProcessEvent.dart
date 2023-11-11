import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:flutter/material.dart';

abstract class LoginProcesEvent {}

class StatusChangedLoginProcess extends LoginProcesEvent {
  StatusChangedLoginProcess( this.status );
  final ProcessLoginStatus status;
}


class StatusReturnLoginProcess extends LoginProcesEvent{} 

