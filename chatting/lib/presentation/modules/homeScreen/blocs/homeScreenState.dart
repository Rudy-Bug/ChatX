import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/domain/repositories/userRepositories.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class HomeScreenState extends Equatable {
  HomeScreenState({required this.user, required this.userRelevant});

  User user;
  List<User> userRelevant;

  HomeScreenState copyWith({User? user, List<User>? userRelevant}) {
    return HomeScreenState(
        user: user ?? this.user,
        userRelevant: userRelevant ?? this.userRelevant);
  }
  
  @override
  List<Object?> get props => [user ,userRelevant  ];
}
