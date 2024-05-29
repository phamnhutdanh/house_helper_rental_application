import 'package:house_helper_rental_application/core/common/entities/booking.dart';

class BookingEmployeeModel extends BookingEmployee {
  BookingEmployeeModel({
    required super.id,
    required super.employeeId,
    required super.bookingId,
  });

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
