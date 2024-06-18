part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

final class BookingCreateDataEvent extends BookingEvent {
  final String bookingTime;
  final String repeatStatus;
  final int totalPrice;
  final String note;
  final String paymentMethod;
  final String serviceId;
  final String accountId;
  final String customerAddressId;
  final List<ServiceDetails> serviceDetails;

  BookingCreateDataEvent({
    required this.bookingTime,
    required this.repeatStatus,
    required this.totalPrice,
    required this.note,
    required this.paymentMethod,
    required this.serviceId,
    required this.accountId,
    required this.customerAddressId,
    required this.serviceDetails,
  });
}

final class BookingChangeStatusEvent extends BookingEvent {
  final String id;
  final BookingStatus bookingStatus;

  BookingChangeStatusEvent({
    required this.id,
    required this.bookingStatus,
  });
}

final class GetAllBookingOfCustomerEvent extends BookingEvent {
  final String customerId;

  GetAllBookingOfCustomerEvent({
    required this.customerId,
  });
}

final class GetBookingByIdEvent extends BookingEvent {
  final String id;

  GetBookingByIdEvent({
    required this.id,
  });
}
