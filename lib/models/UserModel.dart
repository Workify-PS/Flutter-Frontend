class UserModel {
  String? firstName;
  String? lastName;
  String? fullName;
  String? middleName;
  String? jobRole;
  String? empCode;

  UserModel({
      this.firstName,
      this.lastName,
      this.fullName,
      this.middleName,
      this.empCode,
      this.jobRole,
      });

  UserModel.fromJson( json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    middleName = json["middleName"];
    empCode = json["empCode"];
    jobRole = json["role"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    
    data["firstName"] = firstName;
    data["lastName"] = lastName;
    data["middleName"] = middleName;
    data["fullName"] = fullName;
    data["empCode"] = empCode;
    data["role"] = jobRole;
    
    return data;
  }
}
