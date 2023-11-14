class User {
  String? name;
  String? email;
  String? password;
  String? code_id;
  List<String> codeId = List.empty();
  String? image;

  User({this.name, this.email, this.password, this.code_id, this.image});
}
