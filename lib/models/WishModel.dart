class WishModel {
  late String fullName;
  late String empCode;

  WishModel({
    required this.fullName,
   required this.empCode,
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
