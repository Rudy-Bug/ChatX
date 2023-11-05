import 'dart:async';

enum ProcessLoginStatus {
   login ,   
   forgot ,  
   renewPass ,  
   registering 
}


class ProcessLogin {
  final _controllerProcessLogin = StreamController<ProcessLoginStatus>();
  
  Stream<ProcessLoginStatus> get status async*{
    await Future.delayed(const Duration(microseconds: 700)) ; 
    yield ProcessLoginStatus.login ; 
    yield* _controllerProcessLogin.stream ;   
  }

  void  loginProcess(){
    _controllerProcessLogin.add(ProcessLoginStatus.login) ;
  }

  void forgotPasswordProcess() {
    _controllerProcessLogin.add(ProcessLoginStatus.forgot); 
  }

  void dispose() {
    _controllerProcessLogin.close() ;   
  }
}