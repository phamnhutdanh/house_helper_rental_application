part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}

final class BookingHomeInfoDisplaySuccess extends BookingState {
  final List<Employee> topEmployees;
  final List<Service> services;
  final AccountInfo accountInfo;

  BookingHomeInfoDisplaySuccess(
      this.topEmployees, this.services, this.accountInfo);
}

final class CheckoutInfoDisplaySuccess extends BookingState {
  final Service service;
  final AccountInfo accountInfo;

  CheckoutInfoDisplaySuccess(this.service, this.accountInfo);
}

final class BookingCreateDataSuccess extends BookingState {
  final Booking booking;
  BookingCreateDataSuccess(this.booking);
}

final class BookingCreateCustomerAddressSuccess extends BookingState {
  final CustomerAddress customerAddress;
  BookingCreateCustomerAddressSuccess(this.customerAddress);
}
