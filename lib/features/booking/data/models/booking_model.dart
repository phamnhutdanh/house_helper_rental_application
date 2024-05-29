import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';

class BookingModel extends Booking {
  BookingModel({
    required super.id,
    required super.bookingTime,
    required super.totalPrice,
    required super.status,
    required super.repeatStatus,
    required super.paymentMethod,
    required super.note,
    required super.createdAt,
    required super.updatedAt,
    required super.serviceId,
    required super.customerId,
    required super.customerAddressId,
  });

  factory BookingModel.fromJson(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] as String,
      repeatStatus: map['repeatStatus'] == 'NO_REPEAT'
          ? RepeatBookingStatus.NO_REPEAT
          : map['repeatStatus'] == 'EVERY_DAY'
              ? RepeatBookingStatus.EVERY_DAY
              : map['repeatStatus'] == 'EVERY_WEEK'
                  ? RepeatBookingStatus.EVERY_WEEK
                  : RepeatBookingStatus.EVERY_MONTH,
      bookingTime: convertDateFromMillisecondsString(map['bookingTime']),
      totalPrice: int.parse(map['totalPrice']),
      status: map['status'] == 'PENDING'
          ? BookingStatus.PENDING
          : map['status'] == 'ACCEPTED'
              ? BookingStatus.ACCEPTED
              : map['status'] == 'CANCELED'
                  ? BookingStatus.CANCELED
                  : BookingStatus.COMPLETED,
      paymentMethod: map['paymentMethod'] == 'COD'
          ? PaymentMethod.COD
          : PaymentMethod.MOMO,
      note: map['note'] as String,
      createdAt: convertDateFromMillisecondsString(map['createdAt']),
      updatedAt: convertDateFromMillisecondsString(map['updatedAt']),
      serviceId: map['serviceId'] as String,
      customerId: map['customerId'] as String,
      customerAddressId: map['customerAddressId'] as String,
    );
  }

  BookingModel copyWith({
    String? id,
    RepeatBookingStatus? repeatStatus,
    DateTime? bookingTime,
    int? totalPrice,
    BookingStatus? status,
    PaymentMethod? paymentMethod,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? serviceId,
    String? customerId,
    String? customerAddressId,
  }) {
    return BookingModel(
        id: id ?? this.id,
        repeatStatus: repeatStatus ?? this.repeatStatus,
        bookingTime: bookingTime ?? this.bookingTime,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        serviceId: serviceId ?? this.serviceId,
        customerId: customerId ?? this.customerId,
        customerAddressId: customerAddressId ?? this.customerAddressId);
  }
}
