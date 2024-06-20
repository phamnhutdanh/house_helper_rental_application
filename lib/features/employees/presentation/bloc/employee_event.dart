part of 'employee_bloc.dart';

@immutable
sealed class EmployeeEvent {}

final class FetchTopEmployeesEvent extends EmployeeEvent {}

final class GetEmployeeByIdEvent extends EmployeeEvent {
  final String id;

  GetEmployeeByIdEvent({
    required this.id,
  });
}
