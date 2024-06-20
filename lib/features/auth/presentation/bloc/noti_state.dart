part of 'noti_bloc.dart';

@immutable
sealed class NotiState {}

final class NotiInitial extends NotiState {}

final class NotiLoading extends NotiState {}

final class NotiFailure extends NotiState {
  final String error;
  NotiFailure(this.error);
}

final class GetAllNotiSuccess extends NotiState {
  final List<NotificationAccount> notificationAccounts;
  GetAllNotiSuccess(this.notificationAccounts);
}

final class ChangeNotiStatusSuccess extends NotiState {
  final NotificationAccount notificationAccount;
  ChangeNotiStatusSuccess(this.notificationAccount);
}
