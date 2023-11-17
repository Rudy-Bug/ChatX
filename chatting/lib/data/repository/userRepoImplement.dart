import 'dart:convert';
import 'dart:math';

import 'package:chatting/core/service/connectDatabase.dart';
import 'package:chatting/core/service/saveToJson.dart';
import 'package:chatting/core/themes/constantString.dart';
import 'package:chatting/data/models/model.dart';
import 'package:chatting/domain/entities/user.dart';
import 'package:chatting/domain/repositories/userRepositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserService extends UserRepositories {
  final CallAPI _service = CallAPI();
  final SaveToJson _saveToJson = SaveToJson();

  @override
  Future<ReponseModel> signIn(String email, String password) async {
    final reponse = await _service.getUser(email: email, password: password);

    final userToJson = UserToJsonRelevant(
        name: reponse.model.data["data"]["data"]["Name"],
        image: reponse.model.data["data"]["data"]["codePicture"],
        code_id: reponse.model.data["data"]["data"]["Code_ID"]);

    String jsonUser = jsonEncode(userToJson.toJson()); // mapKey của  userKey

    final dataRelevant = reponse.model.data["data"]["relevant"];

    final jsonRelevantUser = jsonEncode(dataRelevant.map((e) {
      //mapKey của userRelevantKey
      return UserToJsonRelevant(
          name: e["Name"], image: e["codePicture"], code_id: e["Code_ID"]);
    }).toList());
    // lưu vô Path_provider :v
    _saveToJson.writeJson(jsonUser, AppStrings.userKey);
    _saveToJson.writeJson(jsonRelevantUser, AppStrings.userRelevantKey);

    await Future.delayed(const Duration(seconds: 1), () {
      print("Into await future state userRepoimplement");
    });
    return reponse;
  }

  @override
  Future<ReponseModel> getPassword(String email) async {
    final reponse = await _service.forgotPassword(user: User(email: email));
    return reponse;
  }

  @override
  Future<ReponseModel> registeringUser(User user) async {
    final reponse = await _service.registerAccount(user: user);
    return reponse;
  }

  @override
  Future<ReponseModel> renewPassword(
      String password, String confirmPassword) async {
    throw UnimplementedError();
  }

  @override
  Future<ReponseModel> changePassword(User user, String newPassword) async {
    final reponse =
        await _service.changePassword(user: user, newPassword: newPassword);
    return reponse;
  }
}
