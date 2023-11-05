import 'package:chatting/core/service/connectDatabase.dart';
import 'package:chatting/data/models/model.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/domain/repositories/userRepositories.dart';

class UserService extends UserRepositories{

  final CallAPI _service = CallAPI() ;  

  @override
  Future<ReponseModel> signIn(String email, String password) async {
      final reponse = await _service.getUser(email: email, password: password);  
      print(reponse);   
      return reponse  ;  
  }

  @override
  Future<ReponseModel> getPassword(String email) async {
    throw UnimplementedError();
  }

  @override
  Future<ReponseModel> registeringUser(User user) async {

    throw UnimplementedError();
  }

  @override
  Future<ReponseModel> renewPassword(String password, String confirmPassword) async {

    throw UnimplementedError();
  }
}