part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthChangeEvent extends AuthEvent {}

class AuthChangeRoute extends AuthEvent {
  const AuthChangeRoute(this.route);
  final String? route;
}

class LogoutEvent extends AuthEvent {}

class AuthValidateEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {}
