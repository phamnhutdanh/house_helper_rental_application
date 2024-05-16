import 'package:house_helper_rental_application/core/common/entities/booking.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';

class BookingModel extends Booking {
  BookingModel(
      {required super.id,
      required super.numsOfEmployee,
      required super.bookingTime,
      required super.totalPrice,
      required super.status,
      required super.paymentMethod,
      required super.note,
      required super.createdAt,
      required super.updatedAt,
      required super.serviceId,
      required super.jobId,
      required super.customerAddressId});

  factory BookingModel.fromJson(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] as String,
      numsOfEmployee: map['numsOfEmployee'] as int,
      bookingTime: convertDateFromMillisecondsString(map['bookingTime']),
      totalPrice: map['totalPrice'] as double,
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
      jobId: map['jobId'] as String,
      customerAddressId: map['customerAddressId'] as String,
    );
  }

  BookingModel copyWith(
      {String? id,
      int? numsOfEmployee,
      DateTime? bookingTime,
      double? totalPrice,
      BookingStatus? status,
      PaymentMethod? paymentMethod,
      String? note,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? serviceId,
      String? jobId,
      String? customerAddressId}) {
    return BookingModel(
        id: id ?? this.id,
        numsOfEmployee: numsOfEmployee ?? this.numsOfEmployee,
        bookingTime: bookingTime ?? this.bookingTime,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        serviceId: serviceId ?? this.serviceId,
        jobId: jobId ?? this.jobId,
        customerAddressId: customerAddressId ?? this.customerAddressId);
  }
}

class BookingEmployeeModel extends BookingEmployee {
  BookingEmployeeModel(
      {required super.id, required super.employeeId, required super.bookingId});

  factory BookingEmployeeModel.fromJson(Map<String, dynamic> map) {
    return BookingEmployeeModel(
      id: map['id'] as String,
      employeeId: map['employeeId'] as String,
      bookingId: map['bookingId'] as String,
    );
  }

  BookingEmployeeModel copyWith({
    String? id,
    String? employeeId,
    String? bookingId,
  }) {
    return BookingEmployeeModel(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      bookingId: bookingId ?? this.bookingId,
    );
  }
}
