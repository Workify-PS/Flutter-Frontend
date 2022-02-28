class LeaveRequestModel {
  int? userId;
  String? empCode;
  String? leaveType;
  String? leaveReason;
  dynamic startDate;
  dynamic endDate;
  String? leaveStatus;
  int? orgId;
  // String? classpath;
  // dynamic createdDate;
  // dynamic modifiedDate;
  // String? createdBy;
  // String? modifiedBy;

  LeaveRequestModel(
      {this.userId,
      this.empCode,
      this.leaveType,
      this.leaveReason,
      this.startDate,
      this.endDate,
      this.leaveStatus,
      this.orgId
      // this.classpath,
      // this.createdDate,
      // this.modifiedDate,
      // this.createdBy,
      // this.modifiedBy
      });

  LeaveRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json[''];
    empCode = json[''];
    leaveType = json[''];
    leaveReason = json[''];
    startDate = json[''];
    endDate = json[''];
    leaveStatus = json[''];
    orgId = json[''];
  }

  Map<String, dynamic> toJson({
    userId,empCode,orgId,
    startDate,endDate,
    leaveType,leaveReason}) {
    return {
      'userId': userId,
      "empCode" : empCode,
      "leaveType" : leaveType,
      "leaveReason" : leaveReason,
      "startDate" : startDate,
      "endDate" : endDate,
      "orgId" : orgId
    };
  }
  
}
