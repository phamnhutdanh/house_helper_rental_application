part of 'accounts_bloc.dart';

@immutable
sealed class AccountsEvent {}

final class FetchAllAccountData extends AccountsEvent {}

final class GetAccountByIdEvent extends AccountsEvent {
  final String id;

  GetAccountByIdEvent({
    required this.id,
  });
}
