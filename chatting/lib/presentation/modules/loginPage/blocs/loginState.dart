import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [email, password, status];

  const LoginState(
      {this.email = "" ,
      this.password = "",
      this.isValid = false,
      this.status = FormzSubmissionStatus.initial});

  final String email;
  final String password;
  final FormzSubmissionStatus status;
  final bool isValid;

  LoginState resetFailure() {
    print("Will Into here? "); 
    return LoginState(
        status: FormzSubmissionStatus.initial,
        email: email,
        password: password,
        isValid: isValid);
  }
  LoginState copyWith({FormzSubmissionStatus? status,
      String? email,
      String? password,
      bool? isValid}) {
    return LoginState(
      status: status ?? this.status ,  
      email: email ?? this.email ,  
      password: password ?? this.password , 
      isValid:  isValid ?? this.isValid 
    ) ;  
  }
}
