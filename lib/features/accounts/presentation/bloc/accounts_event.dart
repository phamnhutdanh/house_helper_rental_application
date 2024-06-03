part of 'accounts_bloc.dart';

@immutable
sealed class AccountsEvent {}

final class FetchAllAccountData extends AccountsEvent {}
