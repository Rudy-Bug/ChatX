import 'package:chatting/data/models/streamModel/authenticate.dart';

abstract class AuthenticateEvent {}

class AuthenticateChangedLogin extends AuthenticateEvent {
  AuthenticateChangedLogin(this.status);
  final AuthenticationStatus status;
}

class AuthenticateChangedLogout extends AuthenticateEvent {}
