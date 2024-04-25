import 'package:ecommerce_c10_maadi/domain/entites/AuthEntity/AuthEntity.dart';

import 'UserModel.dart';

/// message : "success"
/// statusMsg : "fail"
/// user : {"name":"Ali Samir","email":"aslisamirroute@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjQwN2E3YmU4YjUyMzIzNWUwYzg2ZiIsIm5hbWUiOiJBbGkgU2FtaXIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzYzODI1MSwiZXhwIjoxNzIxNDE0MjUxfQ.u0AMAwkKLAcDI1SKTsSXQAEnFRCL25gCLZu7mitr_dI"

class AuthResponseModel {
  AuthResponseModel({
      this.message, 
      this.statusMsg, 
      this.user, 
      this.token,});

  AuthResponseModel.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? statusMsg;
  UserModel? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthEntity toAuthEntity(){
    return AuthEntity(
      token:token,
      user: user?.toUserEntity()
    );
  }
}