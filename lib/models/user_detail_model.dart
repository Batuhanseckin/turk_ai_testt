// To parse this JSON data, do
//
//     final userDetailModel = userDetailModelFromJson(jsonString);

import 'dart:convert';

UserDetailModel userDetailModelFromJson(String str) =>
    UserDetailModel.fromJson(json.decode(str));

String userDetailModelToJson(UserDetailModel data) =>
    json.encode(data.toJson());

class UserDetailModel {
  UserDetailModel({
    this.id,
    this.photo,
    this.name,
    this.surname,
    this.identityNumber,
    this.fatherName,
    this.motherName,
    this.gender,
    this.birthday,
    this.birthPlace,
    this.maritalStatus,
    this.city,
    this.town,
    this.dateOfDeath,
  });

  String? id;
  String? photo;
  String? name;
  String? surname;
  String? identityNumber;
  String? fatherName;
  String? motherName;
  String? gender;
  String? birthday;
  String? birthPlace;
  String? maritalStatus;
  String? city;
  String? town;
  DateTime? dateOfDeath;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        id: json["id"] == null ? null : json["id"],
        photo: json["photo"] == null ? null : json["photo"],
        name: json["name"] == null ? null : json["name"],
        surname: json["surname"] == null ? null : json["surname"],
        identityNumber:
            json["identity_number"] == null ? null : json["identity_number"],
        fatherName: json["father_name"] == null ? null : json["father_name"],
        motherName: json["mother_name"] == null ? null : json["mother_name"],
        gender: json["gender"] == null ? null : json["gender"],
        birthday: json["birthday"] == null ? null : json["birthday"],
        birthPlace: json["birth_place"] == null ? null : json["birth_place"],
        maritalStatus:
            json["marital_status"] == null ? null : json["marital_status"],
        city: json["city"] == null ? null : json["city"],
        town: json["town"] == null ? null : json["town"],
        dateOfDeath: json["date_of_death"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "photo": photo == null ? null : photo,
        "name": name == null ? null : name,
        "surname": surname == null ? null : surname,
        "identity_number": identityNumber == null ? null : identityNumber,
        "father_name": fatherName == null ? null : fatherName,
        "mother_name": motherName == null ? null : motherName,
        "gender": gender == null ? null : gender,
        "birthday": birthday == null ? null : birthday,
        "birth_place": birthPlace == null ? null : birthPlace,
        "marital_status": maritalStatus == null ? null : maritalStatus,
        "city": city == null ? null : city,
        "town": town == null ? null : town,
        "date_of_death": dateOfDeath,
      };
}
