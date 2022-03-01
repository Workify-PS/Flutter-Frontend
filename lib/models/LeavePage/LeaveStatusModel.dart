class LeaveStatusModel {
  String? leaveType;
  dynamic startDate;
  dynamic endDate;
  String? leaveStatus;

  LeaveStatusModel({
    this.leaveType,
    this.startDate,
    this.endDate,
    this.leaveStatus
  });

  LeaveStatusModel.fromJson(Map<String, dynamic> json) {
   leaveType = json['leaveType'];
   startDate = json['startDate'];
   endDate = json['endDate'];
   leaveStatus= json['leaveStatus'];
  }

  
}
