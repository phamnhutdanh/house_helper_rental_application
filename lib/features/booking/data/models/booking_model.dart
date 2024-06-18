import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/service.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:house_helper_rental_application/features/address/data/models/customer_address_model.dart';
import 'package:house_helper_rental_application/features/booking/data/models/booking_service_detail_model.dart';
import 'package:house_helper_rental_application/features/employees/data/models/rating_employee_model.dart';
import 'package:house_helper_rental_application/features/services/data/models/service_model.dart';

class BookingModel extends Booking {
  BookingModel({
    super.id,
    super.bookingTime,
    super.totalPrice,
    super.status,
    super.repeatStatus,
    super.paymentMethod,
    super.note,
    super.createdAt,
    super.updatedAt,
    super.serviceId,
    super.service,
    super.customerId,
    super.employeeId,
    super.customerAddressId,
    super.customerAddress,
    super.bookingServiceDetails,
    super.ratingEmployee,
  });

  factory BookingModel.fromJson(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] as String?,
      repeatStatus: (map['repeatStatus'] == 'NO_REPEAT'
          ? RepeatBookingStatus.NO_REPEAT
          : map['repeatStatus'] == 'EVERY_DAY'
              ? RepeatBookingStatus.EVERY_DAY
              : map['repeatStatus'] == 'EVERY_WEEK'
                  ? RepeatBookingStatus.EVERY_WEEK
                  : RepeatBookingStatus.EVERY_MONTH) as RepeatBookingStatus?,
      bookingTime:
          convertDateFromMillisecondsString(map['bookingTime'] as String?),
      totalPrice: map['totalPrice'] as int?,
      status: (map['status'] == 'PENDING'
          ? BookingStatus.PENDING
          : map['status'] == 'ACCEPTED'
              ? BookingStatus.ACCEPTED
              : map['status'] == 'CANCELED'
                  ? BookingStatus.CANCELED
                  : BookingStatus.COMPLETED) as BookingStatus?,
      paymentMethod: (map['paymentMethod'] == 'COD'
          ? PaymentMethod.COD
          : PaymentMethod.MOMO) as PaymentMethod?,
      note: map['note'] as String?,
      createdAt: convertDateFromMillisecondsString(map['createdAt'] as String?),
      updatedAt: convertDateFromMillisecondsString(map['updatedAt'] as String?),
      serviceId: map['serviceId'] as String?,
      customerId: map['customerId'] as String?,
      employeeId: map['employeeId'] as String?,
      customerAddressId: map['customerAddressId'] as String?,
      service: ServiceModel.fromJson(map['service'] ?? {}),
      customerAddress:
          CustomerAddressModel.fromJson(map['customerAddress'] ?? {}),
      bookingServiceDetails: map['bookingServiceDetails'] != null
          ? (map['bookingServiceDetails'] as List<dynamic>)
              .map((bookingServiceDetail) =>
                  BookingServiceDetailModel.fromJson(bookingServiceDetail))
              .toList()
          : null,
      ratingEmployee: map['ratingEmployee'] != null
          ? RatingEmployeeModel.fromJson(map['ratingEmployee'] ?? {})
          : null,
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
    Service? service,
    String? customerId,
    String? customerAddressId,
    CustomerAddress? customerAddress,
    List<BookingServiceDetail>? bookingServiceDetails,
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
      customerAddressId: customerAddressId ?? this.customerAddressId,
      service: service ?? this.service,
      bookingServiceDetails:
          bookingServiceDetails ?? this.bookingServiceDetails,
      customerAddress: customerAddress ?? this.customerAddress,
    );
  }
}
