class WishModel {
  String? fullName;
  String? empCode;

  WishModel({
    this.fullName,
    this.empCode,
  });

  WishModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    empCode = json['empCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['fullName'] = fullName;
    data['empCode'] = empCode;
    return data;
  }
}
