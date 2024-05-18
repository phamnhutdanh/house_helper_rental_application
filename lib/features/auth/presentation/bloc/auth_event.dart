part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final bool isEmployee;

  AuthSignUp({
    required this.email,
    required this.password,
    required this.name,
    required this.isEmployee,
  });
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  AuthLogin({
    required this.email,
    required this.password,
  });
}

final class AuthSignOut extends AuthEvent {}

final class AuthIsAccountLoggedIn extends AuthEvent {}
