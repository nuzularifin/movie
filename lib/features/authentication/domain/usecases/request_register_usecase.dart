import 'package:equatable/equatable.dart';
import 'package:testcase/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:testcase/core/usecases/usecases.dart';
import 'package:testcase/features/authentication/domain/entities/user.dart';
import 'package:testcase/features/authentication/domain/repository/authentication_repository.dart';

class RequestRegisterUseCase extends UseCase<User, RequestRegisterParams> {
  final AuthenticationRepository authenticationRepository;

  RequestRegisterUseCase({required this.authenticationRepository});

  @override
  Future<Either<Failure, User>> call(RequestRegisterParams params) {
    return authenticationRepository.requestRegister(
        params.username, params.password);
  }
}

class RequestRegisterParams extends Equatable {
  final String username;
  final String password;

  const RequestRegisterParams({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
