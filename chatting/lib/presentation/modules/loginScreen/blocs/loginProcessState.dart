import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProcessLoginState extends Equatable {
  const ProcessLoginState._({this.status = ProcessLoginStatus.login ,  this.isSignUp = false});

  const ProcessLoginState.login() : this._();

  const ProcessLoginState.registering()
      : this._(status: ProcessLoginStatus.registering , isSignUp: true);

  const ProcessLoginState.forgotPassword()
      : this._(status: ProcessLoginStatus.forgot ,isSignUp:false );

  const ProcessLoginState.renewPass()
      : this._(status: ProcessLoginStatus.renewPass ,isSignUp:false );

  @override
  List<Object?> get props => [status,isSignUp];

  final ProcessLoginStatus status;
  final bool isSignUp ;  
}
