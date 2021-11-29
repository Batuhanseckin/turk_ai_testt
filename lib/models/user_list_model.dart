// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) =>
    UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  UserListModel({
    this.id,
    this.name,
    this.surname,
    this.status,
    this.photo,
  });

  String? id;
  String? name;
  String? surname;
  String? status;
  String? photo;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        surname: json["surname"],
        status: json["status"] == null ? null : json["status"],
        photo: json["photo"] == null ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
        "surname": surname,
        "status": status == null ? null : status,
        "photo": photo == null ? null : photo,
      };
}
