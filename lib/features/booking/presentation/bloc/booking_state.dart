part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}

final class ServicesDisplaySuccess extends BookingState {
  final List<Service> services;
  ServicesDisplaySuccess(this.services);
}

final class TopEmployeesDisplaySuccess extends BookingState {
  final List<Employee> topEmployees;
  TopEmployeesDisplaySuccess(this.topEmployees);
}

final class AllEmployeesDisplaySuccess extends BookingState {
  final List<Employee> employees;
  AllEmployeesDisplaySuccess(this.employees);
}

class HomeInfoDisplaySuccess extends BookingState {
  final List<Employee> topEmployees;
  final List<Service> services;

  HomeInfoDisplaySuccess(
    this.topEmployees,
    this.services,
  );
}
