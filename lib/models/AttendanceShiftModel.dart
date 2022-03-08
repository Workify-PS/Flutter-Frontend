// ignore_for_file: unnecessary_this

class AttendanceShiftModel {
  String? shift;
  String? status;
  String? actualIn;
  String? actualOut;
  String? expectedOut;
  String? workHours;
  int? shiftId;
  String? expectedIn;
  String? date;

  AttendanceShiftModel(
      {this.shift,
      this.status,
      this.actualIn,
      this.actualOut,
      this.expectedOut,
      this.workHours,
      this.shiftId,
      this.expectedIn,
      this.date});

  AttendanceShiftModel.fromJson(Map<String, dynamic> json) {
    shift = json['Shift'];
    status = json['Status'];
    actualIn = json['Actual-In'];
    actualOut = json['Actual-Out'];
    expectedOut = json['Expected-Out'];
    workHours = json['Work Hours'];
    shiftId = json['ShiftId'];
    expectedIn = json['Expected-In'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Shift'] = shift;
    data['Status'] = status;
    data['Actual-In'] = actualIn;
    data['Actual-Out'] = this.actualOut;
    data['Expected-Out'] = this.expectedOut;
    data['Work Hours'] = this.workHours;
    data['ShiftId'] = this.shiftId;
    data['Expected-In'] = this.expectedIn;
    data['Date'] = this.date;
    return data;
  }
}
