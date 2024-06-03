part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingFailure extends BookingState {
  final String error;
  BookingFailure(this.error);
}

final class CreateBookingSuccess extends BookingState {
  final Booking booking;
  CreateBookingSuccess(this.booking);
}