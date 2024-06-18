import 'package:house_helper_rental_application/core/common/entities/customer.dart';

class RatingEmployee {
  final String? id;
  final int? score;
  final String? comment;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final String? bookingId;

  final String? customerId;
  final Customer? customer;
  final String? employeeId;

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
  });
}
