part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class AdminLoading extends AdminState {}

final class AdminFailure extends AdminState {
  final String error;
  AdminFailure(this.error);
}

final class ChangeAccountStatusSuccess extends AdminState {
  final AccountInfo accountInfo;
  ChangeAccountStatusSuccess(this.accountInfo);
}
