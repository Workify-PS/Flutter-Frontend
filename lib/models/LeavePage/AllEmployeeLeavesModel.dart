class AllEmployeeLeavesModel {
  int? leaveInfoId;
  int? userId;
  String? userName;
  String? empCode;
  String? leaveType;
  String? leaveReason;
  dynamic startDate;
  dynamic endDate;
  dynamic classPath;
  dynamic createdDate;
  dynamic modifiedDate;
  int? createdBy;
  int? modifiedBy;
  String? leaveStatus;
  int? orgId;

  AllEmployeeLeavesModel({
    this.leaveInfoId,
    this.userId,
    this.userName,
    this.empCode,
    this.leaveType,
    this.leaveReason,
    this.startDate,
    this.endDate,
    this.classPath,
    this.createdDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.leaveStatus,
    this.orgId,
  });

  AllEmployeeLeavesModel.fromJson(Map<String, dynamic> json) {
    leaveInfoId = json['leaveInfoId'];
    userId = json['userId'];
    userName = json['userName'];
    empCode = json['empCode'];
    leaveType = json['leaveType'];
    leaveReason = json['leaveReason'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    leaveStatus = json['leaveStatus'];
    orgId = json['orgId'];
    classPath = json['classPath'];
    createdDate = json['createdDate'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }
}
