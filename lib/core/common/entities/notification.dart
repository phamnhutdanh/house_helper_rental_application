import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class NotificationAccount {
  final String? id;
  final String? description;
  final String? title;
  final NotificationStatus? status;
  final String? imageUri;
  final String? accountId;
  final AccountInfo? account;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NotificationAccount({
    this.id,
    this.title,
    this.description,
    this.status,
    this.imageUri,
    this.accountId,
    this.account,
    this.createdAt,
    this.updatedAt,
  });
}
