import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class Booking {
  final String id;
  final int numsOfEmployee;
  final DateTime bookingTime;
  final double totalPrice;
  final BookingStatus status;
  final PaymentMethod paymentMethod;
  final String note;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String serviceId;
  final String jobId;
  final String customerAddressId;

  Booking(
      {required this.id,
      required this.numsOfEmployee,
      required this.bookingTime,
      required this.totalPrice,
      required this.status,
      required this.paymentMethod,
      required this.note,
      required this.createdAt,
      required this.updatedAt,
      required this.serviceId,
      required this.jobId,
      required this.customerAddressId});
}

class BookingEmployee {
  final String id;
  final String employeeId;
  final String bookingId;

  BookingEmployee({
    required this.id,
    required this.employeeId,
    required this.bookingId,
  });
}
