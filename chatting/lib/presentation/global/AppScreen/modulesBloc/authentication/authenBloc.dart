import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chatting/data/models/streamModel/authenticate.dart';
import 'package:chatting/presentation/global/AppScreen/modulesBloc/authentication/authenEvent.dart';
import 'package:chatting/presentation/global/AppScreen/modulesBloc/authentication/authenState.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  AuthenticateBloc({required AuthenticationRes authenticationRes})
      : _authenticationRes = authenticationRes,
        super(const AuthenticateState.unknown()) {
    on<AuthenticateChangedLogin>(_onAuthenticateChangeLogin);
    on<AuthenticateChangedLogout>(_onAuthenticateChangeLogout);
    _authenticateStreamController = _authenticationRes.status
        .listen((authStatus) => add(AuthenticateChangedLogin(authStatus)));
  }

  final AuthenticationRes _authenticationRes;

  late StreamSubscription<AuthenticationStatus> _authenticateStreamController;

  Future<void> _onAuthenticateChangeLogin(
      AuthenticateChangedLogin event, Emitter<AuthenticateState> emit) async {
    switch (event.status) {
      case AuthenticationStatus.authenticated:
        emit(const AuthenticateState.authenticated());
      case AuthenticationStatus.unauthenticated:
        emit(const AuthenticateState.unauthenticated());
      case AuthenticationStatus.unknown:
        emit(const AuthenticateState.unknown());
    }
  }

  void _onAuthenticateChangeLogout(
      AuthenticateEvent event, Emitter<AuthenticateState> emit) {
    _authenticationRes.logOut();
  }

  @override
  Future<void> close() {
    _authenticateStreamController.cancel();
    return super.close();
  }
}
