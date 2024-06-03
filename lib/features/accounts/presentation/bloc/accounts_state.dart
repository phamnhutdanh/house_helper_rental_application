part of 'accounts_bloc.dart';

@immutable
sealed class AccountsState {}

final class AccountsInitial extends AccountsState {}

final class AccountsLoading extends AccountsState {}

final class AccountsFailure extends AccountsState {
  final String error;
  AccountsFailure(this.error);
}

final class AccountsDisplaySuccess extends AccountsState {
  final List<AccountInfo> accounts;

  AccountsDisplaySuccess(
    this.accounts,
  );
}
