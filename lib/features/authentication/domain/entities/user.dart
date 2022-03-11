final String tableUser = 'users';

class UserFields {
  static final List<String> values = [id, username, password];

  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';
}

class User {
  final int? id;
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UserFields.id] as int?,
        username: json[UserFields.username] as String,
        password: json[UserFields.password] as String,
      );

  Map<String, Object?> toJson() => {
        UserFields.id: id,
        UserFields.username: username,
        UserFields.password: password
      };

  User copy({
    int? id,
    String? username,
    String? password,
  }) =>
      User(
          id: id ?? this.id,
          username: username ?? "",
          password: password ?? "");
}
