import 'package:dartz/dartz.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> saveUsers();
  Future<Either<Failure, User>> deleteUsers(int id);
  Future<Either<Failure, User>> requestLogin(String username, String password);
  Future<Either<Failure, User>> requestRegister(
      String username, String password);
}
