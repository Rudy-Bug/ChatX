import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class ForgotPasswordState extends Equatable{

  const ForgotPasswordState({
     this.mess = ''  ,  
    this.account = '',
    this.number = '',
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
  }) ; 


    final String mess;  
  final String account; // username!
  final String number;
  final FormzSubmissionStatus status;
  final bool isValid;
  
  @override
  // TODO: implement props
  List<Object?> get props => [];




}