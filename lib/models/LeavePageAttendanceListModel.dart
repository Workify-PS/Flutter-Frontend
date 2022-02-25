class LeavePageAttendaceListModel {
  String? shift;
  String? status;
  String? actualIn;
  String? actualOut;
  String? expectedIn;
  String? expectedOut;
  String? workHours;
  int? shiftId;
  dynamic date;

  LeavePageAttendaceListModel(
      {this.shift,
      this.status,
      this.actualIn,
      this.actualOut,
      this.expectedIn,
      this.expectedOut,
      this.workHours,
      this.shiftId,
      this.date});

  LeavePageAttendaceListModel.fromJson(Map<String, dynamic> json) {
    shift = json['Shift'];
    status = json['Status'];
    actualIn = json['Actual-In'];
    actualOut = json['Actual-Out'];
    expectedIn = json['Expected-In'];
    expectedOut = json['Expected-Out'];
    workHours = json['Work Hours'];
    shiftId = json['ShiftId'];
    date = json['Date'];
  }

  
}
