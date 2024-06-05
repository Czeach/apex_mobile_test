
class GetTokenModel {
  bool? status;
  String? message;
  Data? data;
  List<dynamic>? pagination;
  List<dynamic>? meta;
  Errors? errors;
  String? error;

  GetTokenModel({this.status, this.message, this.data, this.pagination, this.meta, this.errors});

  GetTokenModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    pagination = json["pagination"] ?? [];
    meta = json["meta"] ?? [];
    errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
  }

  GetTokenModel.withError(String errorValue)
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
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
  }
}