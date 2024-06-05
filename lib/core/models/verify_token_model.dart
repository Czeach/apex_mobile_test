
class VerifyTokenModel {
  bool? status;
  String? message;
  Data? data;
  List<dynamic>? meta;
  List<dynamic>? pagination;
  Errors? errors;
  String? error;

  VerifyTokenModel({this.status, this.message, this.data, this.meta, this.pagination, this.errors, this.error});

  VerifyTokenModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    meta = json["meta"] ?? [];
    pagination = json["pagination"] ?? [];
    errors = json["errors"] == null ? null : Errors.fromJson(json["errors"]);
  }

  VerifyTokenModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}

class Errors {
  List<String>? token;

  Errors({this.token});

  Errors.fromJson(Map<String, dynamic> json) {
    token = json["token"] == null ? null : List<String>.from(json["token"]);
  }
}

class Data {
  String? email;

  Data({this.email});

  Data.fromJson(Map<String, dynamic> json) {
    email = json["email"];
  }
}