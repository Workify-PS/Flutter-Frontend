// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



// ProfileModel userProfileDataFromJson(Map<String, dynamic> json) => 
//     ProfileModel.fromJson(json);

// String userProfileDataToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  int? userId;
  String? username;
  String? password;
  String? officialMail;
  String? mobile;
  dynamic dob;
  dynamic doj;
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
  int? orgId;
  String? empCode;
  dynamic creationDate;
  dynamic modifiedDate;
  int? createdBy;
  int? modifiedBy;
  bool? active;
  bool? accountLocked;


  ProfileModel({
    this.userId,
    this.username,
    this.password,
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
    this.orgId,
    this.empCode,
    this.creationDate,
    this.modifiedDate,
    this.createdBy,
    this.modifiedBy,
    this.active,
    this.accountLocked,
  });

  

  ProfileModel.fromJson(Map<String, dynamic> json){
    userId = json["userId"];
    username =json["username"];
    password =  json["password"];
    officialMail =  json["officialMail"];
    mobile =  json["mobile"];
    dob =  json["dob"];
    doj =  json["doj"];
    firstName =  json["firstName"];
    lastName =  json["lastName"];
    fullName =  json["fullName"];
    middleName =  json["middleName"];
    country =  json["country"];
    state =  json["state"];
    city =  json["city"];
    workLocation =  json["workLocation"];
    role =  json["role"];
    department =  json["department"];
    orgId =  json["orgId"];
    empCode =  json["empCode"];
    creationDate =  json["creationDate"];
    modifiedDate =  json["modifiedDate"];
    createdBy =  json["createdBy"];
    modifiedBy =  json["modifiedBy"];
    active =  json["active"];
    accountLocked =  json["accountLocked"];
  }
  

Map<String, dynamic> toJson() {
  final Map<String,dynamic> profileModelData = <String,dynamic>{};
    profileModelData["userId"]= userId;
    profileModelData["username"]= username;
    profileModelData["password"]= password;
    profileModelData["officialMail"]= officialMail;
    profileModelData["mobile"]= mobile;
    profileModelData["dob"]= dob;
    profileModelData["doj"]= doj;
    profileModelData["firstName"]= firstName;
    profileModelData["lastName"]= lastName;
    profileModelData["middleName"]= firstName;
    profileModelData["fullName"]= fullName;
    profileModelData["country"]= country;
    profileModelData["state"]= state;
    profileModelData["city"]= city;
    profileModelData["workLocation"]= workLocation;
    profileModelData["role"]= role;
    profileModelData["department"]= department;
    profileModelData["orgId"]= orgId;
    profileModelData["empCode"]= empCode;
    profileModelData["creationDate"]= creationDate;
    profileModelData["modifiedDate"]= modifiedDate;
    profileModelData["createdBy"]= createdBy;
    profileModelData["modifiedBy"]= modifiedBy;
    profileModelData["active"]= active;
    profileModelData["accountLocked"]= accountLocked;
    return profileModelData;
  }
}
