part of 'noti_bloc.dart';

@immutable
sealed class NotiEvent {}

final class ChangeNotiEvent extends NotiEvent {
  final String id;
  final String status;

  ChangeNotiEvent({
    required this.id,
    required this.status,
  });
}

final class GetAllNotiEvent extends NotiEvent {
  final String accountId;

  GetAllNotiEvent({
    required this.accountId,
  });
}
