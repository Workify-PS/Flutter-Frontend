class UserModel {
  String? username;
  String? password;
  bool? isActive;
  String? employee_id;
  String? officialMail;
  String? mobile;
  String? dob;
  String? doj;
  String? firstName;
  String? lastName;
  String? fullName;
  String? middleName;
  String? country;
  String? state;
  String? city;
  String? workLocation;
  String? role;
  String? department;
  bool? isAccountLocked;
  int? orgId;
  String? empCode;
  String? creationDate;
  String? modifiedDate;
  int? createdBy;
  int? modifiedBy;

  UserModel(
      {this.username,
      this.password,
      this.isActive,
      this.officialMail,
      this.mobile,
      this.dob,
      this.doj,
      this.firstName,
      this.lastName,
      this.fullName,
      this.middleName,
      this.country,
      this.state,
      this.city,
      this.workLocation,
      this.role,
      this.department,
      this.isAccountLocked,
      this.orgId,
      this.empCode,
      this.creationDate,
      this.modifiedDate,
      this.createdBy,
      this.modifiedBy});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    isActive = json['isActive'];
    officialMail = json['officialMail'];
    mobile = json['mobile'];
    dob = json['dob'];
    doj = json['doj'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    middleName = json['middleName'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    workLocation = json['workLocation'];
    role = json['role'];
    department = json['department'];
    isAccountLocked = json['isAccountLocked'];
    orgId = json['orgId'];
    empCode = json['empCode'];
    creationDate = json['creationDate'];
    modifiedDate = json['modifiedDate'];
    createdBy = json['createdBy'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['username'] = username;
    data['password'] = password;
    data['isActive'] = isActive;
    data['officialMail'] = officialMail;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['doj'] = doj;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['middleName'] = middleName;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['workLocation'] = workLocation;
    data['role'] = role;
    data['department'] = department;
    data['isAccountLocked'] = isAccountLocked;
    data['orgId'] = orgId;
    data['empCode'] = empCode;
    data['creationDate'] = creationDate;
    data['modifiedDate'] = modifiedDate;
    data['createdBy'] = createdBy;
    data['modifiedBy'] = modifiedBy;
    return data;
  }
}
