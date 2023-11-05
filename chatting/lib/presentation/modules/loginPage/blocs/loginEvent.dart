import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnEmailInputEvent extends LoginEvent {
  OnEmailInputEvent({required this.email});
  @override
  List<Object?> get props => [email];
  final String email;
}

class OnPasswordInputEvent extends LoginEvent {
  OnPasswordInputEvent({required this.password});
  @override
  List<Object?> get props => [password];
  final String password;
}

class OnForgotPasswordEvent extends LoginEvent {}

class OnSubmitted extends LoginEvent {
  OnSubmitted({required this.cl1, required this.cl2});
  late final TextEditingController cl1;
  late final TextEditingController cl2;
}
