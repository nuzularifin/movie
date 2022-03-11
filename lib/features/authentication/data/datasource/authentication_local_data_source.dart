import 'package:testcase/core/db/user_database.dart';
import 'package:testcase/core/utils/database_helper.dart';
import 'package:testcase/features/authentication/data/models/user_model.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';

abstract class AuthenticationLocalDataSource {
  Future<User> requestLogin(String username, String password);
  Future<User> register(String username, String password);
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<User> requestLogin(String username, String password) async {
    User user = await UserDatabase.instance
        .readUserByUsernameAndPassword(username, password);
    return user;
  }

  @override
  Future<User> register(String username, String password) async {
    User user = await UserDatabase.instance
        .create(User(username: username, password: password));
    return user;
  }
}
