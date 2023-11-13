import 'package:chatting/data/models/model.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:dio/dio.dart';

class CallAPI {
  final dio = Dio(BaseOptions(
      contentType: Headers.jsonContentType,
      baseUrl: 'http://10.169.128.154:8080/api',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3)));
  // ifconfig en0 | grep inet ==> Tìm ip của macOs
  String domain = 'http://localhost:8080/api';
  String domain2 = 'http://192.168.1.4:8080/api';
  String domain3Cty = 'http://10.169.128.154:8080/api' ;
  final url = "http://localhost:8080/api/user/signUp"; // anotation

  void configureDio() {
    // Set default configs
    dio.options.baseUrl = domain;
    dio.options.contentType = Headers.jsonContentType;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }




  Future<ReponseModel> changePassword({User? user , String? newPassword}) async {
   try {
      await Future.delayed(
        const Duration(microseconds: 1000),
      );
      final response = await dio.patch(
  
        '/user/changePasswordWithoutHeaders',
        data: {
          'Email': user?.email,
          'Password': user?.password,
          'NewPassword': newPassword,
        },
      );
      return ReponseModel(
          model: true ,
          message: response.data["message"],
          statusCode: response.statusCode as int);
    } on DioException catch (e) {
      print("Into dioException ForgotPassword ?>");
      if (e.response?.statusCode == 404) {
      // print("Into ${e.response?.data["message"]}");
        return ReponseModel(
            model: false,
            message: e.response?.data["message"],
            statusCode: e.response?.statusCode as int);
      } else {
        return ReponseModel(
            model: false, message: "Something went wrong? ", statusCode: 500);
      }
    }
  }

  Future<ReponseModel> getUser({String? email, String? password}) async {
    User userDevice = User();

    try {
      final response = await dio.get(
        '/user/loginUser',
        data: {'Email': email, 'Password': password},
      );
      print("crash here ? ");
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
        return ReponseModel(
            model: null,
            message: e.response?.data["message"],
            statusCode: e.response?.statusCode as int);
      } else {
        print("========== > catch Exception: ${e.response?.data["message"]}");
        return ReponseModel(
            model: null, message: "Something went wrong? ", statusCode: 500);
      }
    }
  }
/*
  // Testting!
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

  */


  Future<ReponseModel> forgotPassword({User? user}) async {
   try {
      await Future.delayed(
        const Duration(microseconds: 1000),
      );
      final response = await dio.post(
        '/user/forgotPassword',
        data: {
          'Email': user?.email,
        },
      );
      // print("object: " +  response.data) ;  
      return ReponseModel(
          model: response.data["data"]['data']['Password'] ,
          message: response.data["message"],
          statusCode: response.statusCode as int);
    } on DioException catch (e) {
      print("Into dioException ForgotPassword ?>");
      if (e.response?.statusCode == 404) {
        return ReponseModel(
            model: false,
            message: e.response?.data["message"],
            statusCode: e.response?.statusCode as int);
      } else {
        return ReponseModel(
            model: false, message: "Something went wrong? ", statusCode: 500);
      }
    }
  }

  Future<ReponseModel> registerAccount({User? user}) async {
    try {
      await Future.delayed(
        const Duration(microseconds: 1000),
      );
      final response = await dio.post(
        '/user/signUp',
        data: {
          'Email': user?.email,
          'Password': user?.password,
          'Name': user?.name
        },
      );
      return ReponseModel(
          model: true,
          message: response.data["message"],
          statusCode: response.statusCode as int);
    } on DioException catch (e) {
      print("Into dioException registering>");
      if (e.response?.statusCode == 404) {
        return ReponseModel(
            model: false,
            message: e.response?.data["message"],
            statusCode: e.response?.statusCode as int);
      } else {
        return ReponseModel(
            model: false, message: "Something went wrong? ", statusCode: 500);
      }
    }
  }
}
