class EmployeeDetailsModel {
  int? userPosId;
  int? userId;
  String? empCode;
  String? designation;
  String? grade;
  String? empCategory;
  String? empStatus;
  String? empType;
  String? department;
  String? location;
  int? l1ManagerId;
  int? l2ManagerId;
  int? hrManagerId;
  int? orgId;
  bool? isActive;
  dynamic creationDate;
  dynamic modifiedDate;
  int? createdBy;
  int? modifiedBy;

  EmployeeDetailsModel(
      {this.userPosId,
      this.userId,
      this.empCode,
      this.designation,
      this.grade,
      this.empCategory,
      this.empStatus,
      this.empType,
      this.department,
      this.location,
      this.l1ManagerId,
      this.l2ManagerId,
      this.hrManagerId,
      this.orgId,
      this.isActive,
      this.creationDate,
      this.modifiedDate,
      this.createdBy,
      this.modifiedBy});

  EmployeeDetailsModel.fromJson(Map<String, dynamic> json) {
    userPosId = json["userPosId"];
    userId = json["userId"];
    empCode = json['empCode'];
    designation = json["designation"];
    grade = json["grade"];
    empCategory = json["empCategory"];
    empStatus = json["empStatus"];
    empType = json["empType"];
    department = json["department"];
    location = json["location"];
    l1ManagerId = json["l1ManagerId"];
    l2ManagerId = json["l2ManagerId"];
    hrManagerId = json["hrManagerId"];
    orgId = json["orgId"];
    isActive = json["isActive"];
    creationDate = json["creationDate"];
    modifiedDate = json["modifiedDate"];
    createdBy = json["createdBy"];
    modifiedBy = json["modifiedBy"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> employeeDetailsModelData = <String, dynamic>{};
    employeeDetailsModelData["userPosId"] = userPosId;
    employeeDetailsModelData["userId"] = userId;
    employeeDetailsModelData['empCode'] = empCode;
    employeeDetailsModelData["designation"] = designation;
    employeeDetailsModelData["grade"] = grade;
    employeeDetailsModelData["empCategory"] = empCategory;
    employeeDetailsModelData["empStatus"] = empStatus;
    employeeDetailsModelData["empType"] = empType;
    employeeDetailsModelData["department"] = department;
    employeeDetailsModelData["location"] = location;
    employeeDetailsModelData["l1ManagerId"] = l1ManagerId;
    employeeDetailsModelData["l2ManagerId"] = l2ManagerId;
    employeeDetailsModelData["hrManagerId"] = hrManagerId;
    employeeDetailsModelData["orgId"] = orgId;
    employeeDetailsModelData["isActive"] = isActive;
    employeeDetailsModelData["creationDate"] = creationDate;
    employeeDetailsModelData["modifiedDate"] = modifiedDate;
    employeeDetailsModelData["createdBy"] = createdBy;
    employeeDetailsModelData["modifiedBy"] = modifiedBy;
    
    return employeeDetailsModelData;
  }
}
