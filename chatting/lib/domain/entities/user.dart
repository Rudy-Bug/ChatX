import 'package:chatting/core/themes/constantString.dart';

class User {
  final String name;
  final String email;
  final String password;
  final String number;
  final String code_id = AppStrings.appCodeDefault;
  final List<String> codeId = List.empty();

  User(
      {this.name = "", this.email = " ", this.number = "", this.password = ""});
}
