import 'package:chatting/data/models/model.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:dio/dio.dart';

class CallAPI {
  final dio = Dio();
  final domain = "http://localhost:8080/api";
  final url = "http://localhost:8080/api/user/signUp";

  void configureDio() {
    // Set default configs
    dio.options.baseUrl = domain;
    dio.options.contentType = Headers.jsonContentType;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<ReponseModel> getUser({String? email, String? password}) async {
    User userDevice = User();
    print("Into here? Get User?");
    try {
      configureDio();
      final response = await dio.get(
        '/user/loginUser',
        data: {'Email': email, 'Password': password},
      );

      if (response.statusCode == 200) {
        final data = response.data["data"]["data"];
        userDevice.name = data["Name"];
        userDevice.code_id = data["Code_ID"];
        userDevice.email = data["Email"];
      }
      return ReponseModel(
          model: userDevice,
          message: response.data["message"],
          statusCode: response.statusCode as int);
    } on DioException catch (e) {
      print("Into dioException>");  
      if (e.response?.statusCode == 404) {
            return  ReponseModel(
          model: null ,
          message: e.response?.data["message"] ,
          statusCode: e.response?.statusCode as int);
      } else { 
        return  ReponseModel(
          model: null ,
          message: "Something went wrong? " ,
          statusCode: 500 );
      }
    }
  }


  Future<void> getUserB({String? email, String? password}) async {
    User userDevice = User();
    print("Into here? Get User?");
    try {
      configureDio();
      final response = await dio.get(
        '/user/loginUser',
        data: {'Email': email, 'Password': password},
      );
      print(response.data) ;
      if (response.statusCode == 200) {
        final data = response.data["data"]["data"];
        userDevice.name = data["Name"];
        userDevice.code_id = data["Code_ID"];
        userDevice.email = data["Email"];
      }
        print("User: ${userDevice.name}") ;  
    } on DioException catch (e) {
      print("Into dioException>");  
      print(e) ;  
      if (e.response?.statusCode == 404) {
            print(e) ; 
            print(e.response?.data["message"]) ; 
      } else { 
       
      }
    }
  }
}
