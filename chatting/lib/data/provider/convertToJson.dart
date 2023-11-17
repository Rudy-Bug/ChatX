import 'dart:convert';

import 'package:chatting/core/service/saveToJson.dart';
import 'package:chatting/core/themes/constantString.dart';
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
 } // disable :v
  Future< Map<String, dynamic>> convertStoragetoModel() async {
      SaveToJson storage = SaveToJson(); //  gọi đến hàm lưu và lấy dữ liệu từ storage
      final user = await storage.readJson(AppStrings.userKey);  // get data từ storage, có await async
      final userRelevant = await storage.readJson(AppStrings.userRelevantKey); // get data từ storage 
      List<User> listUserRelevant = <User>[]; 
       Map<String, dynamic> parseModel = jsonDecode(user as String); 
      User userAccount = User.fromJson(parseModel); // parse data lấy từ storage , từ json về model
      print("Into here?");
      final List<dynamic> parsedList = jsonDecode(userRelevant as String); 
      listUserRelevant = parsedList.map(
        (e) {
          return User.fromJson(e);
        },
      ).toList();    // parse data lấy từ storage , từ json về model
      print("Get user : $userAccount"); 
      print("Get userRelevant : $listUserRelevant"); 
      return {
        "listUserRelevant": listUserRelevant, // List<User> 
        "user": userAccount // User
      };
    }
}  