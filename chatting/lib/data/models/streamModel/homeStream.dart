
import 'dart:async';

enum HomeStreamStatus {
   home ,   
   setting ,  
   chatting ,  
   logout  
}


class HomeStream {
  final _controllerHomeStream = StreamController<HomeStreamStatus>();
  
  Stream<HomeStreamStatus> get status async*{
    await Future.delayed(const Duration(microseconds: 700)) ; 
    yield HomeStreamStatus.home ; 
    yield* _controllerHomeStream.stream ;   
  }

  void  logoutStatus(){
    _controllerHomeStream.add(HomeStreamStatus.logout) ;
  }

  void settingStatus() {
    _controllerHomeStream.add(HomeStreamStatus.setting); 
  }

  void chattingStatus() {
    _controllerHomeStream.add(HomeStreamStatus.chatting); 
  }

  void homeStatus() {
    _controllerHomeStream.add(HomeStreamStatus.home); 

  }

  void dispose() {
    _controllerHomeStream.close() ;   
  }
}