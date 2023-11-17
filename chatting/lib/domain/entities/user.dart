class User {
  String? name;
  String? email;
  String? password;
  String? code_id;
  List<String> codeId = List.empty();
  String? image;

  User({this.name, this.email, this.password, this.code_id, this.image});
}


class UserToJsonRelevant {
  String? name;
  String? code_id;
  String? image;
  UserToJsonRelevant({required this.name , required this.code_id ,  required this.image}) ;
   Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code_id': code_id,
      'image' : image 
    };
  } 

}
