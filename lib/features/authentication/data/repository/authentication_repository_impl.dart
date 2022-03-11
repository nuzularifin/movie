import 'package:testcase/features/authentication/data/datasource/authentication_local_data_source.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testcase/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImpl({required this.authenticationLocalDataSource});

  @override
  Future<Either<Failure, User>> requestLogin(
      String username, String password) async {
    try {
      return Right(
          await authenticationLocalDataSource.requestLogin(username, password));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> requestRegister(
      String username, String password) async {
    return Right(
        await authenticationLocalDataSource.register(username, password));
  }
}
