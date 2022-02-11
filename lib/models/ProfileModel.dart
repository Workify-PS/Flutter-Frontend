// To parse required this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';


ProfileModel userProfileDataFromJson(Map<String, dynamic> json) => 
    ProfileModel.fromJson(json);

String userProfileDataToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.userId,
    required this.username,
    required this.password,
    required this.officialMail,
    required this.mobile,
    required this.dob,
    required this.doj,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.middleName,
    required this.country,
    required this.state,
    required this.city,
    required this.workLocation,
    required this.role,
    required this.department,
    required this.orgId,
    required this.empCode,
    required this.creationDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
    required this.active,
    required this.accountLocked,
  });

  int userId;
  String username;
  String password;
  String officialMail;
  String mobile;
  dynamic dob;
  dynamic doj;
  String firstName;
  String lastName;
  String fullName;
  String middleName;
  String country;
  String state;
  String city;
  String workLocation;
  String role;
  String department;
  int orgId;
  String empCode;
  dynamic creationDate;
  dynamic modifiedDate;
  int createdBy;
  int modifiedBy;
  bool active;
  bool accountLocked;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        userId: json["userId"],
        username: json["username"],
        password: json["password"],
        officialMail: json["officialMail"],
        mobile: json["mobile"],
        dob: json["dob"],
        doj: json["doj"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        middleName: json["middleName"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        workLocation: json["workLocation"],
        role: json["role"],
        department: json["department"],
        orgId: json["orgId"],
        empCode: json["empCode"],
        creationDate: json["creationDate"],
        modifiedDate: json["modifiedDate"],
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        active: json["active"],
        accountLocked: json["accountLocked"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "password": password,
        "officialMail": officialMail,
        "mobile": mobile,
        "dob": dob,
        "doj": doj,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "middleName": middleName,
        "country": country,
        "state": state,
        "city": city,
        "workLocation": workLocation,
        "role": role,
        "department": department,
        "orgId": orgId,
        "empCode": empCode,
        "creationDate": creationDate,
        "modifiedDate": modifiedDate,
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "active": active,
        "accountLocked": accountLocked,
      };
}
