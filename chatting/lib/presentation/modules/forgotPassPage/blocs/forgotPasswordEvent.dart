import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnInputCodeMock extends ForgotPasswordEvent {
  OnInputCodeMock({required this.codeMock});
  final String codeMock;
  @override
  List<Object?> get props => [codeMock];
}

class OnInputYourEmail extends ForgotPasswordEvent {
  OnInputYourEmail({required this.email});

  final String email;
  @override
  List<Object?> get props => [email];
}

class OnSubmittedEmail extends ForgotPasswordEvent {
  OnSubmittedEmail({required this.emailController});
  final TextEditingController emailController;

  void removeText() {
    emailController.clear();
  }
}


class OnConfirmCode extends ForgotPasswordEvent {
  OnConfirmCode() ;  
}

class OnInputNewPassword  extends ForgotPasswordEvent{
  final String newPassword ;  
  OnInputNewPassword({required this.newPassword});  
  @override
  List<Object?> get props => [newPassword];
}


class OnSubbmitedNewPassword extends ForgotPasswordEvent {


  OnSubbmitedNewPassword();



}

class OnCancelForgotPassword extends ForgotPasswordEvent {}

