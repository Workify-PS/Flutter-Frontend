class WishModel {
  String? dob;
  String? doj;
  String? fullName;
  String? empCode;

  WishModel({
    this.dob,
    this.doj,
    this.fullName,
    this.empCode,
  });

  WishModel.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    doj = json['doj'];
    fullName = json['fullName'];
    empCode = json['empCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['dob'] = dob;
    data['doj'] = doj;
    data['fullName'] = fullName;
    data['empCode'] = empCode;
    return data;
  }
}
