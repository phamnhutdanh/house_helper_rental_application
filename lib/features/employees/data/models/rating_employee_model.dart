import 'package:house_helper_rental_application/core/common/entities/rating.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:house_helper_rental_application/features/customers/data/models/customer_model.dart';

class RatingEmployeeModel extends RatingEmployee {
  RatingEmployeeModel({
    super.id,
    super.score,
    super.comment,
    super.createdAt,
    super.updatedAt,
    super.bookingId,
    super.customerId,
    super.customer,
    super.employeeId,
  });

  factory RatingEmployeeModel.fromJson(Map<String, dynamic> map) {
    return RatingEmployeeModel(
      id: map['id'] as String?,
      score: map['score'] as int?,
      comment: map['comment'] as String?,
      createdAt: convertDateFromMillisecondsString(map['createdAt'] as String?),
      updatedAt: convertDateFromMillisecondsString(map['updatedAt'] as String?),
      bookingId: map['bookingId'] as String?,
      customerId: map['customerId'] as String?,
      employeeId: map['employeeId'] as String?,
      customer: CustomerModel.fromJson(map['customer'] ?? {}),
    );
  }
}
