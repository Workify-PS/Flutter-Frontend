class DailyAttendance {
  String inTime;
  List<String> outTime = [""];
  // String get latestoutTime => outTime.last;
  // void addnewtime() {
  //   String time =
  //       DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  //   outTime.add(time);
  // }
  DailyAttendance({
    this.inTime = "",
  });
}
