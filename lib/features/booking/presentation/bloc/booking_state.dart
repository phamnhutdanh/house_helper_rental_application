part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}

class HomeInfoDisplaySuccess extends BookingState {
  final List<Employee> topEmployees;
  final List<Service> services;
  final AccountInfo accountInfo;

  HomeInfoDisplaySuccess(this.topEmployees, this.services, this.accountInfo);
}

class CheckoutInfoDisplaySuccess extends BookingState {
  final Service service;

  CheckoutInfoDisplaySuccess(this.service);
}
