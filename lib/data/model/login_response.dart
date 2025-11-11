class LoginResponseModel {
  String? status;
  String? message;
  User? user;

  LoginResponseModel({this.status, this.message, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? iD;
  String? nAME;
  String? eMAIL;
  String? uSERTYPE;
  String? cREATEDAT;

  User({this.iD, this.nAME, this.eMAIL, this.uSERTYPE, this.cREATEDAT});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAME = json['NAME'];
    eMAIL = json['EMAIL'];
    uSERTYPE = json['USER_TYPE'];
    cREATEDAT = json['CREATED_AT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAME'] = this.nAME;
    data['EMAIL'] = this.eMAIL;
    data['USER_TYPE'] = this.uSERTYPE;
    data['CREATED_AT'] = this.cREATEDAT;
    return data;
  }
}