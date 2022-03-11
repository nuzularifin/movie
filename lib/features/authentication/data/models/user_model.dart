import 'package:testcase/features/authentication/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String username, required String password})
      : super(username, password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
