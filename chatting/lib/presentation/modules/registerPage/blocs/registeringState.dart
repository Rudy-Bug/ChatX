import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RegisteringState extends Equatable {
  const RegisteringState(
      {this.name = '',
      this.status = FormzSubmissionStatus.initial,
      this.email = '',
      this.password = '',
      this.isValid = false,
      this.passwordConfirm = '',
      this.mess = ''});
  final String name;
  final String email;
  final String password;
  final bool isValid;
  final String passwordConfirm;
  final String mess;
  final FormzSubmissionStatus status;
  @override
  List<Object?> get props => [name, email, password, passwordConfirm];

  RegisteringState copyWith(
      {String? name,
      String? email,
      bool? isValid,
      String? password,
      FormzSubmissionStatus? status,
      String? passwordConfirm,
      String? mess}) {
    return RegisteringState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      password: password ?? this.password,
      name: name ?? this.name,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
    );
  }

  RegisteringState resetRegistering() {
    return const RegisteringState(
      status: FormzSubmissionStatus.initial,
      email: "",
      isValid: false,
      mess: "",
      password: "",
      name: "",
      passwordConfirm: "",
    );
  }
}
