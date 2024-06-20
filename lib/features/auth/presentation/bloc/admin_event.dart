part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

final class ChangeAccountStatusEvent extends AdminEvent {
  final String accountId;
  final AccountStatus status;

  ChangeAccountStatusEvent({
    required this.accountId,
    required this.status,
  });
}
