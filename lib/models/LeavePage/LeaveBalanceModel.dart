class LeaveBalanceModel {
  String? leaveType;
  dynamic startDate;
  dynamic endDate;
  String? leaveStatus;

  LeaveBalanceModel({
    this.leaveType,
    this.startDate,
    this.endDate,
    this.leaveStatus
  });

  LeaveBalanceModel.fromJson(Map<String, dynamic> json) {
   leaveType = json['leaveType'];
   startDate = json['startDate'];
   endDate = json['endDate'];
   leaveStatus= json['leaveStatus'];
  }

  
}
