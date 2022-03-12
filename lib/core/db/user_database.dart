import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();

  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableUser (${UserFields.id} $idType,${UserFields.username} $textType,
    ${UserFields.password} $textType
      )
      ''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    final id = await db.insert(tableUser, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(tableUser,
        columns: UserFields.values,
        where: '${UserFields.id} = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<User> readUserByUsernameAndPassword(
      String username, String password) async {
    final db = await instance.database;

    final maps = await db.query(tableUser,
        columns: UserFields.values,
        where: '${UserFields.username} = ? AND ${UserFields.password} = ?',
        whereArgs: ['%$username%', '%$password%']);
    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('Email $username tidak ditemukan');
    }
  }

  // Future<User> getLogin(String username, String password) async {
  //   var dbClient = await instance.database;
  //   var res = await dbClient.rawQuery("SELECT * FROM user WHERE username = '$username' and password = '$password'");

  //   if (res.length > 0) {
  //     return User.fromMap(res.first);
  //   }
  //   return throw Exception('ID $username not found');;
  // }

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;

    final orderBy = '${UserFields.id} ASC';

    final result = await db.query(tableUser, orderBy: orderBy);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableUser, where: '${UserFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
