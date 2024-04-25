import '../../../domain/entites/AuthEntity/UserEntity.dart';

/// name : "Ali Samir"
/// email : "aslisamirroute@gmail.com"
/// role : "user"

class UserModel {
  UserModel({
      this.name, 
      this.email, 
      this.role,});

  UserModel.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity(){
    return UserEntity(
      name: name,
      email: email
    );
  }

}