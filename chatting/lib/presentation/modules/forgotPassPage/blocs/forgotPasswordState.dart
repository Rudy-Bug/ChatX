import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.mess = '',
    this.email = '',
    this.codeMock = '',
    this.newPasswordConfirm = '',
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.isInputCode = false,
    this.isRenewpassword = false,
  });
  final String mess;
  final String email; // username!
  final FormzSubmissionStatus status;
  final bool isValid;
  final bool isInputCode;
  final bool isRenewpassword;
  final String codeMock;
  final String newPasswordConfirm;

  ForgotPasswordState copyWith(
      {String? email,
      bool? isValid,
      bool? isInputCode,
      bool? isRenewpassword,
      String? newPasswordConfirm,
      String? codeMock,
      FormzSubmissionStatus? status,
      String? mess}) {
    return ForgotPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
      isRenewpassword: isRenewpassword ?? this.isRenewpassword,
      isInputCode: isInputCode ?? this.isInputCode,
      codeMock: codeMock ?? this.codeMock,
      newPasswordConfirm: newPasswordConfirm ?? this.newPasswordConfirm,
    );
  }

  ForgotPasswordState resetForgotPassword() {
    return const ForgotPasswordState(
      status: FormzSubmissionStatus.initial,
      email: "",
      isValid: false,
      mess: "",
      codeMock: "",
      newPasswordConfirm: "",
      isInputCode: false,
      isRenewpassword: false,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        codeMock,
        newPasswordConfirm,
        isValid,
        isRenewpassword,
        isInputCode
      ];
}
