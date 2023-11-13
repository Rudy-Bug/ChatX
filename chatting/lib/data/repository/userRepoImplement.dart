import 'dart:math';

import 'package:chatting/core/service/connectDatabase.dart';
import 'package:chatting/data/models/model.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/domain/repositories/userRepositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserService extends UserRepositories{

  final CallAPI _service = CallAPI() ;  

  @override
  Future<ReponseModel> signIn(String email, String password) async {
      final reponse = await _service.getUser(email: email, password: password);  
         await  Future.delayed(const Duration(seconds: 1) ,  (){
          print("Into await future state userRepoimplement") ;
      } );
      return reponse  ;  
  }

  @override
  Future<ReponseModel> getPassword(String email) async {
      final reponse = await _service.forgotPassword(user: User(email: email));  
      return reponse  ;  
  }

  @override
  Future<ReponseModel> registeringUser(User user) async {
    final reponse = await _service.registerAccount(user:user) ;
      return reponse ;  
  }
  
  @override
  Future<ReponseModel>   renewPassword(String password, String confirmPassword) async {

    throw UnimplementedError();
  }
  
  @override
  Future<ReponseModel> changePassword(User user, String newPassword) async{

  final reponse = await _service.changePassword(user:user , newPassword: newPassword ) ;
      return reponse ; 
  }
}