class UpdateEmployeeInfoCombined {
  String? userId;
  String? city;
  String? country;
  String? department;
  dynamic dob;
  dynamic doj;
  String? empCode;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  bool? isAccountBlocked;
  bool? isActive;
  String? mobile;
  int? modifiedBy;
  int? createdBy;
  dynamic modifiedDate;
  dynamic createdDate;
  String? officialMail;
  int? orgId;
  String? userName;
  String? password;
  String? jobRole;
  String? state;
  String? workLocation;
  String? marriageStatus;
  dynamic dom;
  String? jobPosition;
  String? designation;
  String? grade;
  String? employementCategory;
  String? employementStatus;
  String? employementType;
  int? l1ManagerId;
  int? l2ManagerId;
  int? hrManagerId;

  UpdateEmployeeInfoCombined({
      this.userId,
      this.city,
      this.country,
      this.department,
      this.dob,
      this.doj,
      this.empCode,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.isAccountBlocked,
      this.isActive,
      this.mobile,
      this.modifiedBy,
      this.createdBy,
      this.modifiedDate,
      this.createdDate,
      this.officialMail,
      this.orgId,
      this.userName,
      this.password,
      this.jobRole,
      this.state,
      this.workLocation,
      this.marriageStatus,
      this.dom,
      this.jobPosition,
      this.designation,
      this.grade,
      this.employementCategory,
      this.employementStatus,
      this.employementType,
      this.l1ManagerId,
      this.l2ManagerId,
      this.hrManagerId
    });

  UpdateEmployeeInfoCombined.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
    city = json["city"];
    country = json["country"];
    department = json["department"];
    dob = json["dob"];
    doj = json["doj"];
    empCode = json["empCode"];
    firstName = json["firstName"];
    middleName = json["middleName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    isAccountBlocked = json["isAccountBlocked"];
    isActive = json["isActive"];
    mobile = json["mobile"];
    modifiedBy = json["modifiedBy"];
    createdBy = json["createdBy"];
    modifiedDate = json["modifiedDate"];
    createdDate = json["createdDate"];
    officialMail = json["officialMail"];
    orgId = json["orgId"];
    userName = json["userName"];
    password = json["password"];
    jobRole = json["jobRole"];
    state = json["state"];
    workLocation = json["workLocation"];
    marriageStatus = json["marriageStatus"];
    dom = json["dom"];
    jobPosition = json["jobPosition"];
    designation = json["designation"];
    grade = json["grade"];
    employementCategory = json["employementCategory"];
    employementStatus = json["employementStatus"];
    employementType = json["employementType"];
    l1ManagerId = json["l1ManagerId"];
    l2ManagerId = json["l2ManagerId"];
    hrManagerId = json["hrManagerId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> UpdateEmployeeInfoCombinedModelData =
        <String, dynamic>{};
    UpdateEmployeeInfoCombinedModelData["userId"] = userId;
    UpdateEmployeeInfoCombinedModelData["city"] = city;
    UpdateEmployeeInfoCombinedModelData["country"] = country;
    UpdateEmployeeInfoCombinedModelData["department"] = department;
    UpdateEmployeeInfoCombinedModelData["dob"] = dob;
    UpdateEmployeeInfoCombinedModelData["doj"] = doj;
    UpdateEmployeeInfoCombinedModelData["empCode"] = empCode;
    UpdateEmployeeInfoCombinedModelData["firstName"] = firstName;
    UpdateEmployeeInfoCombinedModelData["middleName"] = middleName;
    UpdateEmployeeInfoCombinedModelData["lastName"] = lastName;
    UpdateEmployeeInfoCombinedModelData["fullName"] = fullName;
    UpdateEmployeeInfoCombinedModelData["isAccountBlocked"] = isAccountBlocked;
    UpdateEmployeeInfoCombinedModelData["isActive"] = isActive;
    UpdateEmployeeInfoCombinedModelData["mobile"] = mobile;
    UpdateEmployeeInfoCombinedModelData["modifiedBy"] = modifiedBy;
    UpdateEmployeeInfoCombinedModelData["createdBy"] = createdBy;
    UpdateEmployeeInfoCombinedModelData["modifiedDate"] = modifiedDate;
    UpdateEmployeeInfoCombinedModelData["createdDate"] = createdDate;
    UpdateEmployeeInfoCombinedModelData["officialMail"] = officialMail;
    UpdateEmployeeInfoCombinedModelData["orgId"] = orgId;
    UpdateEmployeeInfoCombinedModelData["userName"] = userName;
    UpdateEmployeeInfoCombinedModelData["password"] = password;
    UpdateEmployeeInfoCombinedModelData["jobRole"] = jobRole;
    UpdateEmployeeInfoCombinedModelData["state"] = state;
    UpdateEmployeeInfoCombinedModelData["workLocation"] = workLocation;
    UpdateEmployeeInfoCombinedModelData["marriageStatus"] = marriageStatus;
    UpdateEmployeeInfoCombinedModelData["dom"] = dom;
    UpdateEmployeeInfoCombinedModelData["jobPosition"] = jobPosition;
    UpdateEmployeeInfoCombinedModelData["designation"] = designation;
    UpdateEmployeeInfoCombinedModelData["grade"] = grade;
    UpdateEmployeeInfoCombinedModelData["employementCategory"] =
        employementCategory;
    UpdateEmployeeInfoCombinedModelData["employementStatus"] =
        employementStatus;
    UpdateEmployeeInfoCombinedModelData["employementType"] = employementType;
    UpdateEmployeeInfoCombinedModelData["l1ManagerId"] = l1ManagerId;
    UpdateEmployeeInfoCombinedModelData["l2ManagerId"] = l2ManagerId;
    UpdateEmployeeInfoCombinedModelData["hrManagerId"] = hrManagerId;
    return UpdateEmployeeInfoCombinedModelData;
  }
}
