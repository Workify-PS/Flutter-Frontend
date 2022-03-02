class YourBalanceLeaves {
  int? plLeft;
  int? clLeft;

  YourBalanceLeaves({this.plLeft, this.clLeft});

  YourBalanceLeaves.fromJson(Map<String, dynamic> json) {
    plLeft = json["PL left"];
    clLeft = json["CL left"];
  }
  
}
