class WishModel {
  late String fullName;
  late String empCode;
  late String email;
  late String firstName;
  late int userId;
  WishModel(
      {required this.fullName,
      required this.empCode,
      required this.email,
      required this.firstName});

  WishModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    empCode = json['empCode'];
    email = json['email'];
    firstName = json['firstname']??"";
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['fullName'] = fullName;
    data['empCode'] = empCode;
    data['email'] = email;
    data['firstname'] = firstName;
    data['userId'] = userId;
    return data;
  }
}
