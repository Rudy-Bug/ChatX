import 'package:chatting/data/models/model.dart';
import 'package:chatting/data/models/streamModel/loginProcess.dart';
import 'package:chatting/data/repository/userRepoImplement.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringEvent.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RegisteringBloc extends Bloc<RegisteringEvent, RegisteringState> {
  RegisteringBloc({required ProcessLogin processLogin})
      : _processLogin = processLogin,
        userService = UserService(),
        super(const RegisteringState()) {
    on<OnInputName>(_onInputName);
    on<OnInputPasswordConfirm>(_onInputConfirmPassword);
    on<OnInputEmail>(_onInputEmail);
    on<OnInputPassword>(_onInputPassword);
    on<OnSubmittedRegistering>(_onSubbmitedRegistering);
    on<OnResetRegisteringPage>(_onResetRegisteringPage);
  }

  final ProcessLogin _processLogin;
  final UserService userService;

  void _onInputName(OnInputName evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        name: evet.name,
        isValid: (state.email == '' ||
                state.password == '' ||
                state.passwordConfirm == '' ||
                evet.name == ''
            ? false
            : true)));
  }

  void _onResetRegisteringPage(
      OnResetRegisteringPage event, Emitter<RegisteringState> emit) {
    emit(state.resetRegistering());
  }

  void _onInputConfirmPassword(
      OnInputPasswordConfirm evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        passwordConfirm: evet.passwordConfirm,
        isValid: (state.email == '' ||
                state.password == '' ||
                evet.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  void _onInputEmail(OnInputEmail evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        email: evet.email,
        isValid: (evet.email == '' ||
                state.password == '' ||
                state.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  void _onInputPassword(OnInputPassword evet, Emitter<RegisteringState> emit) {
    emit(state.copyWith(
        password: evet.password,
        isValid: (state.email == '' ||
                evet.password == '' ||
                state.passwordConfirm == '' ||
                state.name == ''
            ? false
            : true)));
  }

  Future<void> _onSubbmitedRegistering(
      OnSubmittedRegistering event, Emitter<RegisteringState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        if (state.password != state.passwordConfirm) {
          emit(state.copyWith(
              status: FormzSubmissionStatus.failure,
              mess: "plss Confirm your password be target:v"));
        } else {
          if(state.status.isInProgress) print("Inprogress?") ; 
          User userRegistering = User(
              name: state.name, password: state.password, email: state.email);
          late ReponseModel value;
          await Future.delayed(const Duration(seconds: 2), () async {
            value = await userService.registeringUser(userRegistering);
          });
          if (value.statusCode == 200) {
            event.removeText();
            emit(state.resetRegistering());
            _processLogin.loginProcess();
          } else {
            event.removeText();
            emit(state.copyWith(
                status: FormzSubmissionStatus.failure, mess: value.message));
          }
        }
      } catch (_) {
        print("into here exception On Subbmited");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
