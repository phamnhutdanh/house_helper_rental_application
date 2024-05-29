part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

final class BookingFetchAllHomeData extends BookingEvent {}

final class BookingFetchAllCheckoutData extends BookingEvent {
  final String serviceId;

  BookingFetchAllCheckoutData({
    required this.serviceId,
  });
}
