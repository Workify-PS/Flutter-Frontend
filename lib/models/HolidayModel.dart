class HolidayModel {
  late String holidayName;
  late String date;
  late String imagePath;
  HolidayModel({
    required this.holidayName,
    required this.date,
    required this.imagePath,
  });

  HolidayModel.fromJson(Map<String, dynamic> json) {
    // date = json['date'] ?? "";
    // imagePath = json['imagePath'] ?? "";
    // holidayName = hName;
    holidayName = json['hname'];
    date = json['date'];
    imagePath = json['imagepath'] ?? "";
  }
}
