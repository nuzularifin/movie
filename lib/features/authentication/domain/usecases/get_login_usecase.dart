import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:testcase/core/usecases/usecases.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';
import 'package:testcase/features/authentication/domain/repository/authentication_repository.dart';

class GetLoginUseCase extends UseCase<User, GetLoginParams> {
  final AuthenticationRepository authenticationRepository;

  GetLoginUseCase({required this.authenticationRepository});
  @override
  Future<Either<Failure, User>> call(GetLoginParams params) {
    return authenticationRepository.requestLogin(
        params.username, params.password);
  }
}

class GetLoginParams extends Equatable {
  final String username;
  final String password;

  const GetLoginParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
