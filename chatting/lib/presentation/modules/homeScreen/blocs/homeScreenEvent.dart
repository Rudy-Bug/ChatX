import 'package:chatting/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingData extends HomeScreenEvent { 
  
}

class OnSettingClick extends HomeScreenEvent {
  OnSettingClick();

}

class OnChatBoxUserTap extends HomeScreenEvent {
  User user ;  
  OnChatBoxUserTap({required this.user});
  @override
  // TODO: implement props
  List<Object?> get props => [user];

 
}

class OnSearchUser extends HomeScreenEvent {
  OnSearchUser();

}



