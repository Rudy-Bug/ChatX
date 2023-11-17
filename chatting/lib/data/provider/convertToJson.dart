import 'package:chatting/domain/entities/user.dart';

class ConvertToJson {
 Map<String,dynamic>  userToJson(User? user)
 {
    return {
      "Name" : user?.name , 
      "Code_ID" : user?.code_id , 
      "codePicture" : user?.name , 
      "name" : user?.name , 
      "name" : user?.name , 
    } ;
 }
}  /// ko dung :)