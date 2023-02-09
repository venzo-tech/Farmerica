import 'dart:convert';

class CustomerModel {
  String email;
  String mobileNumber;
  String password;

  CustomerModel({required this.email,required this.mobileNumber,required this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({'email': email, 'mobileNumber': mobileNumber, 'password': password, 'username': email});
    return map;
  }
}

UserResponseModel userResponseFromJson(String str) => UserResponseModel.fromJson(json.decode(str));

class UserResponseModel {
  int? code;
  String? message;

  UserResponseModel({this.code, this.message});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
