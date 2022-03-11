part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RequestRegisterEvent extends RegisterEvent {
  final String username;
  final String password;

  const RequestRegisterEvent({required this.username, required this.password});
}
