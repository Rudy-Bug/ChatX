class ReponseModel {
  dynamic model;
  String message;
  int statusCode;
  ReponseModel(
      {required this.model,  this.message = "",  this.statusCode = 505});
}


