import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class NotificationEmployee {
  final String? id;
  final String? title;
  final String? description;
  final NotificationStatus? status;
  final String? imageUri;
  final String? employeeId;

  NotificationEmployee({
    this.id,
    this.title,
    this.description,
    this.status,
    this.imageUri,
    this.employeeId,
  });
}

class NotificationCustomer {
  final String? id;
  final String? title;
  final NotificationStatus? status;
  final String? description;
  final String? imageUri;
  final String? customerId;

  NotificationCustomer({
    this.id,
    this.title,
    this.description,
    this.status,
    this.imageUri,
    this.customerId,
  });
}
