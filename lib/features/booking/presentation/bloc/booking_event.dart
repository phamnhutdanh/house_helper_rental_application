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

final class BookingCreateData extends BookingEvent {
  final String bookingTime;
  final String repeatStatus;
  final int totalPrice;
  final String note;
  final String paymentMethod;
  final String serviceId;
  final String customerId;
  final String customerAddressId;
  final List<ServiceDetails> serviceDetails;

  BookingCreateData({
    required this.bookingTime,
    required this.repeatStatus,
    required this.totalPrice,
    required this.note,
    required this.paymentMethod,
    required this.serviceId,
    required this.customerId,
    required this.customerAddressId,
    required this.serviceDetails,
  });
}

final class BookingCreateCustomerAddress extends BookingEvent {
  final String address;
  final String fullName;
  final String phone;
  final String customerId;
  final bool isDefault;

  BookingCreateCustomerAddress({
    required this.address,
    required this.fullName,
    required this.phone,
    required this.customerId,
    required this.isDefault,
  });
}
