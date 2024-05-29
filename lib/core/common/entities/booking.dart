import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class Booking {
  final String? id;
  final DateTime? bookingTime;
  final BookingStatus? status;
  final RepeatBookingStatus? repeatStatus;
  final PaymentMethod? paymentMethod;
  final String? note;
  final int? totalPrice;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  final String? serviceId;
  final String? customerId;
  final String? customerAddressId;

  Booking({
    this.id,
    this.bookingTime,
    this.totalPrice,
    this.status,
    this.repeatStatus,
    this.paymentMethod,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.serviceId,
    this.customerId,
    this.customerAddressId,
  });
}

class BookingEmployee {
  final String? id;
  final String? employeeId;
  final String? bookingId;

  BookingEmployee({
    this.id,
    this.employeeId,
    this.bookingId,
  });
}

class BookingServiceDetail {
  final String? id;
  final String? serviceDetailId;
  final String? bookingId;

  BookingServiceDetail({
    this.id,
    this.serviceDetailId,
    this.bookingId,
  });
}
