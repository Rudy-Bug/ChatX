import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSettingClick extends HomeScreenEvent {
  OnSettingClick();

}

class OnChatBoxUserTap extends HomeScreenEvent {
  OnChatBoxUserTap();

 
}

class OnSearchUser extends HomeScreenEvent {
  OnSearchUser();

}



