class UserModel {
  String? firstName;
  String? lastName;
  String? fullName;
  String? middleName;
  String? jobRole;
  String? empCode;
  int? userID;

  UserModel(
      {this.firstName,
      this.lastName,
      this.fullName,
      this.middleName,
      this.empCode,
      this.jobRole,
      this.userID});

  UserModel.fromJson(json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    middleName = json["middleName"];
    empCode = json["empCode"];
    jobRole = json["role"];
    userID = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["middleName"] = middleName;
    data["fullName"] = fullName;
    data["empCode"] = empCode;
    data["role"] = jobRole;
    data['userId'] = userID;
    return data;
  }
}
