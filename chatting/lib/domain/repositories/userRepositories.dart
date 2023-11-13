import 'package:chatting/data/models/model.dart';
import 'package:chatting/domain/entities/user.dart';

abstract class UserRepositories {

      
      Future<ReponseModel> signIn(String email, String password)  ; 

      Future<ReponseModel> registeringUser(User user) ;  

      Future<ReponseModel> getPassword(String password) ;  

      Future<ReponseModel> changePassword(User user, String newPassword) ;  
      

      Future<ReponseModel> renewPassword(String password, String confirmPassword) ;


}