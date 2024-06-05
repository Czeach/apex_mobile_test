
class LoginModel {
  bool? status;
  String? message;
  Data? data;
  List<dynamic>? meta;
  Errors? errors;
  String? error;

  LoginModel({this.status, this.message, this.data, this.meta, this.errors, this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    meta = json["meta"] ?? [];
    errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
  }

   LoginModel.withError(String errorValue)
      : data = null,
        error = errorValue;

}

class Errors {
  List<String>? email;

  Errors({this.email});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json["email"] == null ? null : List<String>.from(json["email"]);
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
  String? id;
  String? fullName;
  String? username;
  String? email;
  dynamic phone;
  dynamic phoneCountry;
  String? country;
  dynamic avatar;

  User({this.id, this.fullName, this.username, this.email, this.phone, this.phoneCountry, this.country, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullName = json["full_name"];
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    phoneCountry = json["phone_country"];
    country = json["country"];
    avatar = json["avatar"];
  }
}