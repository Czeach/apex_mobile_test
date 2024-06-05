
class RegisterModel {
  bool? status;
  String? message;
  Data? data;
  List<dynamic>? meta;
  Errors? errors;
  String? error;

  RegisterModel({this.status, this.message, this.data, this.meta, this.errors, this.error});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    meta = json["meta"] ?? [];
    errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
  }

  RegisterModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}

class Errors {
  List<String>? email;
  List<String>? password;
  List<String>? country;

  Errors({this.email, this.password, this.country});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json["email"] == null ? null : List<String>.from(json["email"]);
    password = json["password"] == null ? null : List<String>.from(json["password"]);
    country = json["country"] == null ? null : List<String>.from(json["country"]);
  }
}

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    token = json["token"];
  }
}

class User {
  String? fullName;
  String? username;
  String? email;
  String? country;
  String? id;

  User({this.fullName, this.username, this.email, this.country, this.id});

  User.fromJson(Map<String, dynamic> json) {
    fullName = json["full_name"];
    username = json["username"];
    email = json["email"];
    country = json["country"];
    id = json["id"];
  }
}