part of 'app_account_cubit.dart';

@immutable
sealed class AppAccountState {}

final class AppAccountInitial extends AppAccountState {}

final class AppAccountLoggedIn extends AppAccountState {
  final AccountInfo accountInfo;
  AppAccountLoggedIn(this.accountInfo);
}
