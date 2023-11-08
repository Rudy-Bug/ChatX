import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisteringEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnInputName extends RegisteringEvent {
  final String name;
  OnInputName({required this.name});
  @override
  List<Object?> get props => [name];
}

class OnInputEmail extends RegisteringEvent {
  final String email;
  OnInputEmail({required this.email});

  @override
  List<Object?> get props => [email];
}

class OnInputPassword extends RegisteringEvent {
  final String password;
  OnInputPassword({required this.password});

  @override
  List<Object?> get props => [password];
}

class OnInputPasswordConfirm extends RegisteringEvent {
  final String passwordConfirm;

  OnInputPasswordConfirm({required this.passwordConfirm});
  @override
  List<Object?> get props => [passwordConfirm];
}
class OnResetRegisteringPage extends RegisteringEvent {
  
}

class OnSubmittedRegistering extends RegisteringEvent {
  OnSubmittedRegistering({required this.tcName, required this.tcEmailAddress, required this.tcPassword, required this.tcConfirm });
  final TextEditingController tcName;
  final TextEditingController tcEmailAddress;
  final TextEditingController tcPassword;
  final TextEditingController tcConfirm;

  void removeText()
  {
      tcName.clear() ; 
      tcEmailAddress.clear() ; 
      tcPassword.clear() ; 
      tcConfirm.clear() ; 
  }
}
