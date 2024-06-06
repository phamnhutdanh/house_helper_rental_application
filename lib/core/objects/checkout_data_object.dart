import 'package:house_helper_rental_application/core/common/entities/service.dart';

class BookingDetailsObject {
  final String bookingTime;
  final String repeatStatus;
  final int totalPrice;
  final String note;
  final String paymentMethod;
  final String serviceId;
  final String customerAddressId;
  final List<ServiceDetails> serviceDetails;

  final String address;
  final String fullName;
  final String phone;

  BookingDetailsObject({
    required this.bookingTime,
    required this.repeatStatus,
    required this.totalPrice,
    required this.note,
    required this.paymentMethod,
    required this.serviceId,
    required this.customerAddressId,
    required this.serviceDetails,
    required this.address,
    required this.fullName,
    required this.phone,
  });
}
