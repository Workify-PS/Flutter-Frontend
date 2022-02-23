class EmployeeInfoCombined {
  int? userId;
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
  bool? accountLocked;
  bool? active;
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

  EmployeeInfoCombined(
      {this.userId,
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
      this.accountLocked,
      this.active,
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
      this.hrManagerId});

  EmployeeInfoCombined.fromJson(Map<String, dynamic> json) {
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
    accountLocked = json["accountLocked"];
    active = json["active"];
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

  Map<String, dynamic> toJson({employeeInfoCombined}) {
    return {
      "userId": employeeInfoCombined.userId,
      "city": employeeInfoCombined.city,
      "country": employeeInfoCombined.country,
      "department": employeeInfoCombined.department,
      "dob": employeeInfoCombined.dob,
      "doj": employeeInfoCombined.doj,
      "empCode": employeeInfoCombined.empCode,
      "firstName": employeeInfoCombined.firstName,
      "middleName": employeeInfoCombined.middleName,
      "lastName": employeeInfoCombined.lastName,
      "fullName": employeeInfoCombined.fullName,
      "mobile": employeeInfoCombined.mobile,
      "modifiedBy": employeeInfoCombined.modifiedBy,
      "createdBy": employeeInfoCombined.createdBy,
      "modifiedDate": employeeInfoCombined.modifiedDate,
      "createdDate": employeeInfoCombined.createdDate,
      "officialMail": employeeInfoCombined.officialMail,
      "orgId": employeeInfoCombined.orgId,
      "userName": employeeInfoCombined.userName,
      "password": "password",
      "jobRole": employeeInfoCombined.jobRole,
      "state": employeeInfoCombined.state,
      "workLocation": employeeInfoCombined.workLocation,
      "marriageStatus": employeeInfoCombined.marriageStatus,
      "dom": employeeInfoCombined.dom,
      "jobPosition": employeeInfoCombined.jobPosition,
      "designation": employeeInfoCombined.designation,
      "grade": employeeInfoCombined.grade,
      "employementCategory": employeeInfoCombined.employementCategory,
      "employementStatus": employeeInfoCombined.employementStatus,
      "employementType": employeeInfoCombined.employementType,
      "l1ManagerId": employeeInfoCombined.l1ManagerId,
      "l2ManagerId": employeeInfoCombined.l2ManagerId,
      "hrManagerId": employeeInfoCombined.hrManagerId,
      "accountLocked": employeeInfoCombined.accountLocked,
      "active": employeeInfoCombined.active
    };
  }
}
