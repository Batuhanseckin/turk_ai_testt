// To parse this JSON data, do
//
//     final BaseModel = BaseModelFromJson(jsonString);

import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  dynamic data;
  String? message;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : json["data"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data,
        "message": message == null ? null : message,
      };
}
