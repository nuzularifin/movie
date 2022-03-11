import 'package:testcase/features/authentication/domain/entities/user.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testcase/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<Either<Failure, User>> deleteUsers(int id) {
    // TODO: implement deleteUsers
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> requestLogin(String username, String password) {
    // TODO: implement requestLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> requestRegister(
      String username, String password) {
    // TODO: implement requestRegister
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> saveUsers() {
    // TODO: implement saveUsers
    throw UnimplementedError();
  }
}
