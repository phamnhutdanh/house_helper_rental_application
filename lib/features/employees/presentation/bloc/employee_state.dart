part of 'employee_bloc.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class EmployeeLoading extends EmployeeState {}

final class EmployeeFailure extends EmployeeState {
  final String error;
  EmployeeFailure(this.error);
}

final class TopEmployeesDisplaySuccess extends EmployeeState {
  final List<Employee> topEmployees;

  TopEmployeesDisplaySuccess(this.topEmployees);
}
