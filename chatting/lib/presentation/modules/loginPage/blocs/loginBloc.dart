import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginEvent.dart';
import 'package:chatting/presentation/modules/loginPage/blocs/loginState.dart';
import 'package:chatting/presentation/modules/loginScreen/blocs/loginProcessBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRes authenticationRes , required ProcessLogin loginProcessBloc})
      : _authenRes = authenticationRes,
      _loginProcess =  loginProcessBloc , 
        super(const LoginState()) {
    // on<OnEmailInputEvent>
    // on<OnPasswordInputEvent>
    // on<OnForgotPasswordEvent>
    // on<OnSubmitted>
  }

  final AuthenticationRes _authenRes;
  final ProcessLogin _loginProcess ;

  void _onEmailChanged(OnEmailInputEvent event, Emitter<LoginState> emit) {
    var email = event.email;
    emit(state.copyWith(
        email: email,
        isValid: (state.password == "" || email == "") ? false : true));
  }

  void _onForgotPassword(OnForgotPasswordEvent event, Emitter<LoginState> emit) {
    _loginProcess.forgotPasswordProcess() ;  
    emit(state.copyWith(
        status: FormzSubmissionStatus.initial,
        isValid: false,
        email: "",
        password: ""));
  }


  void _onPasswordChanged(OnPasswordInputEvent event , Emitter<LoginState>  emit) {
      var password = event.password ;  
      emit(state.copyWith(
           password: password,
        isValid: (state.email == "" || password == "") ? false : true));
  }
  Future<void> _onSubmitted(OnSubmitted event ,  Emitter<LoginState> emit) async {
      if(state.isValid) {
          emit(state.copyWith(status: FormzSubmissionStatus.inProgress)) ;  

        try{
              int value  = await _authenRes. _ _ 

              if(value == 1) 
              {
                emit(state.copyWith(status: FormzSubmissionStatus.success)) ;  
              }
              if(value == 0) 
              {
                emit(state.copyWith(status: FormzSubmissionStatus.failure, isValid: false));  
              }
        }catch(_) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure, isValid: false));  
        }

      }
  }
}
