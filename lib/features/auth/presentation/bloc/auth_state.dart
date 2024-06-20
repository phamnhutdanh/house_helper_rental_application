part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AccountInfo accountInfo;
  const AuthSuccess(this.accountInfo);
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

final class UpdateInfoCustomerSuccess extends AuthState {
  final AccountInfo accountInfo;
  const UpdateInfoCustomerSuccess(this.accountInfo);
}
