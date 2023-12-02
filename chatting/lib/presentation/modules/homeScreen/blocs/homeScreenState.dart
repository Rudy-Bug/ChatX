import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/domain/repositories/userRepositories.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class HomeScreenState extends Equatable {
  HomeScreenState(
      { this.user  ,
      this.userRelevant ,
      this.mess = "",
      this.status = FormzSubmissionStatus.initial});

   User? user;
  List<User>? userRelevant;
  String mess;
  FormzSubmissionStatus status;

  HomeScreenState copyWith({
    User? user,
    List<User>? userRelevant,
    FormzSubmissionStatus? status,
    String? mess 
  }) {
    return HomeScreenState(
        user: user ?? this.user,
        status: status ?? this.status,
        mess: mess ?? this.mess,
        userRelevant: userRelevant ?? this.userRelevant);
  }

  @override
  List<Object?> get props => [user, userRelevant, status, mess];
}
