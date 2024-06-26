import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';

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
  final Service? service;
  final String? customerId;
  final String? employeeId;

  final String? customerAddressId;
  final CustomerAddress? customerAddress;
  final List<BookingServiceDetail>? bookingServiceDetails;

  final RatingEmployee? ratingEmployee;

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
    this.service,
    this.customerId,
    this.employeeId,
    this.customerAddressId,
    this.customerAddress,
    this.bookingServiceDetails,
    this.ratingEmployee,
  });
}

class BookingServiceDetail {
  final String? id;
  final String? serviceDetailId;
  final ServiceDetails? serviceDetails;

  final String? bookingId;

  BookingServiceDetail({
    this.id,
    this.serviceDetailId,
    this.serviceDetails,
    this.bookingId,
  });
}
