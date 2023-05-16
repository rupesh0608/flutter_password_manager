class LoginModel {
  bool? error;
  int? statusCode;
  String? message;
  String? token;
  Data? data;

  LoginModel(
      {this.error, this.statusCode, this.message, this.token, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    error = json['error']?? true;
    statusCode = json['statusCode'];
    message = json['message']??"";
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? picUrl;
  bool? isNotificationEnable;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.email,
        this.picUrl,
        this.isNotificationEnable});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName']??"";
    lastName = json['lastName']??"";
    fullName = json['fullName']??"";
    email = json['email']??"";
    picUrl = json['picUrl']??"";
    isNotificationEnable = json['isNotificationEnable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['picUrl'] = this.picUrl;
    data['isNotificationEnable'] = this.isNotificationEnable;
    return data;
  }
}
