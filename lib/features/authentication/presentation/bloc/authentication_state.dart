part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {}

class AuthenticationFailedState extends AuthenticationState {
  final String message;

  const AuthenticationFailedState({required this.message});
}

class OpenLoginState extends AuthenticationState {}

class OpenDashboardState extends AuthenticationState {}
