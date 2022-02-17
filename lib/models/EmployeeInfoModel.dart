class EmployeeInfoModel {
  int? userId;
  String? username;
  String? password;
  String? officialMail;
  String? mobile;
  dynamic dob;
  dynamic doj;
  String? firstName;
  String? lastName;
  String? fullName;
  String? middleName;
  String? country;
  String? state;
  String? city;
  String? workLocation;
  String? role;
  String? department;
  int? orgId;
  String? empCode;
  dynamic creationDate;
  dynamic modifiedDate;
  int? createdBy;
  int? modifiedBy;
  bool? active;
  bool? accountLocked;

  EmployeeInfoModel({
    this.userId,
    this.username,
    this.password,
    this.officialMail,
    this.mobile,
    this.dob,
    this.doj,
    this.firstName,
    this.lastName,
    this.fullName,
    this.middleName,
    this.country,
    this.state,
    this.city,
    this.workLocation,
    this.role,
    this.department,
    this.orgId,
    this.empCode,
    this.creationDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.active,
    this.accountLocked,
  });

  EmployeeInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    username = json["username"];
    password = json["password"];
    officialMail = json["officialMail"];
    mobile = json["mobile"];
    dob = json["dob"];
    doj = json["doj"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    middleName = json["middleName"];
    country = json["country"];
    state = json["state"];
    city = json["city"];
    workLocation = json["workLocation"];
    role = json["role"];
    department = json["department"];
    orgId = json["orgId"];
    empCode = json["empCode"];
    creationDate = json["creationDate"];
    modifiedDate = json["modifiedDate"];
    createdBy = json["createdBy"];
    modifiedBy = json["modifiedBy"];
    active = json["active"];
    accountLocked = json["accountLocked"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> EmployeeInfoModelData = <String, dynamic>{};
    EmployeeInfoModelData["userId"] = userId;
    EmployeeInfoModelData["username"] = username;
    EmployeeInfoModelData["password"] = password;
    EmployeeInfoModelData["officialMail"] = officialMail;
    EmployeeInfoModelData["mobile"] = mobile;
    EmployeeInfoModelData["dob"] = dob;
    EmployeeInfoModelData["doj"] = doj;
    EmployeeInfoModelData["firstName"] = firstName;
    EmployeeInfoModelData["lastName"] = lastName;
    EmployeeInfoModelData["middleName"] = firstName;
    EmployeeInfoModelData["fullName"] = fullName;
    EmployeeInfoModelData["country"] = country;
    EmployeeInfoModelData["state"] = state;
    EmployeeInfoModelData["city"] = city;
    EmployeeInfoModelData["workLocation"] = workLocation;
    EmployeeInfoModelData["role"] = role;
    EmployeeInfoModelData["department"] = department;
    EmployeeInfoModelData["orgId"] = orgId;
    EmployeeInfoModelData["empCode"] = empCode;
    EmployeeInfoModelData["creationDate"] = creationDate;
    EmployeeInfoModelData["modifiedDate"] = modifiedDate;
    EmployeeInfoModelData["createdBy"] = createdBy;
    EmployeeInfoModelData["modifiedBy"] = modifiedBy;
    EmployeeInfoModelData["active"] = active;
    EmployeeInfoModelData["accountLocked"] = accountLocked;
    return EmployeeInfoModelData;
  }
}
