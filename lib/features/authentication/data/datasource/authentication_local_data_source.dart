import 'package:testcase/core/utils/database_helper.dart';
import 'package:testcase/features/authentication/data/models/user_model.dart';

abstract class AuthenticationLocalDataSource {
  Future<UserModel> requestLogin(String username, String password);
}

class AuthenticationLocalDataSourceImpl extends AuthenticationLocalDataSource {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<UserModel> requestLogin(String username, String password) async {
    var dbClient = await databaseHelper.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM user WHERE username = '$username' and password = '$password'");
    if (res.length > 0) {
      return UserModel.fromJson(res.first);
    }
    return UserModel.fromJson(res.first);
  }
}
