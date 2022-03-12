import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/db/user_database.dart';
import 'package:testcase/core/utils/database_helper.dart';
import 'package:testcase/core/utils/global_variables.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';

abstract class AuthenticationLocalDataSource {
  Future<User> requestLogin(String username, String password);
  Future<User> register(String username, String password);

  Future<bool> saveStatusLogin(bool status);
  Future<bool> checkStatusLogin();
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  DatabaseHelper databaseHelper = DatabaseHelper();
  final SharedPreferences sharedPreferences;

  AuthenticationLocalDataSourceImpl({required this.sharedPreferences});

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

  @override
  Future<bool> checkStatusLogin() async {
    bool isLogin = false;
    isLogin = sharedPreferences.getBool(GlobalVariables.prefsLogin) ?? false;
    return isLogin;
  }

  @override
  Future<bool> saveStatusLogin(bool status) async {
    return await sharedPreferences.setBool(GlobalVariables.prefsLogin, status);
  }
}
