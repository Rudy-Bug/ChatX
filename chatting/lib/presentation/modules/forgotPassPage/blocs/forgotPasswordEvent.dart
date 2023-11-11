import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class OnInputYourName extends ForgotPasswordEvent {
  OnInputYourName({required this.name}) ; 
  final String name ;   
  @override
  List<Object?> get props => [name];
}

class OnInputYourEmail extends ForgotPasswordEvent {
  OnInputYourEmail({required this.email}) ;  

   final String email ;  
   @override
  List<Object?> get props => [email]; 
}

class OnInputPassword extends ForgotPasswordEvent{
    OnInputPassword({required this.password}) ;  

   final String password ;  
   @override
  List<Object?> get props => [password]; 
}


class OnInputPasswordConfirm extends ForgotPasswordEvent{
    OnInputPasswordConfirm({required this.passwordConfirm}) ;  

   final String passwordConfirm ;  
   @override
  List<Object?> get props => [passwordConfirm]; 
}