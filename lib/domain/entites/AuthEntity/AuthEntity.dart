import 'UserEntity.dart';

/// user : {"name":"Ali Samir","email":"aslisamirroute2@gmail.com"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MjQwOWM4YmU4YjUyMzIzNWUwZDNjMSIsIm5hbWUiOiJBbGkgU2FtaXIiLCJyb2xlIjoidXNlciIsImlhdCI6MTcxMzYzNzgzMywiZXhwIjoxNzIxNDEzODMzfQ.cYmuwox72ei3EVr7dklc4EXWOkoYCBeEJv3ba97uGhE"

class AuthEntity {
  AuthEntity({
      this.user, 
      this.token,});

  UserEntity? user;
  String? token;



}