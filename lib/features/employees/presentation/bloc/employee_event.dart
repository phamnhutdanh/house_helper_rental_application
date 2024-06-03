part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

final class FetchTopEmployeesEvent extends EmployeeEvent {}
