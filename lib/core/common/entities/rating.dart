import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';

class RatingEmployee {
  final String? id;
  final double? score;
  final String? comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final String? bookingId;

  final String? customerId;
  final Customer? customer;
  final String? employeeId;
  final Employee? employee;

  RatingEmployee({
    this.id,
    this.score,
    this.comment,
    this.createdAt,
    this.updatedAt,
    this.bookingId,
    this.customerId,
    this.customer,
    this.employeeId,
    this.employee,
  });
}
