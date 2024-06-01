part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

final class AdminFetchAllAccountData extends AdminEvent {}
