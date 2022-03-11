part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class RequestLoginEvent extends AuthenticationEvent {
  final String username;
  final String password;

  const RequestLoginEvent(this.username, this.password);
}
