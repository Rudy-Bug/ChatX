import 'dart:async';

enum AuthenticationStatus { unknown, unauthenticated, authenticated }

class AuthenticationRes {
  final _authenticateStreamController =
      StreamController<AuthenticationStatus>();

// the durating with milliseconds is the mock for loading data. Config when base is stable!
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(milliseconds: 750));
    yield AuthenticationStatus.unauthenticated;
    yield* _authenticateStreamController.stream;
  }


  void login() {
    print("Into here ? ") ;  
    _authenticateStreamController.add(AuthenticationStatus.authenticated);
       print("Join stream ? ") ;  
  }

  void logOut() {
    _authenticateStreamController.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _authenticateStreamController.close();
}
