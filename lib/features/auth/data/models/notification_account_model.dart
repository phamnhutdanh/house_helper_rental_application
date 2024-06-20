import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/common/entities/notification.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:house_helper_rental_application/features/auth/data/models/account_model.dart';

class NotificationAccountModel extends NotificationAccount {
  NotificationAccountModel({
    super.id,
    super.title,
    super.description,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.account,
    super.accountId,
    super.imageUri,
  });

  factory NotificationAccountModel.fromJson(Map<String, dynamic> map) {
    return NotificationAccountModel(
      id: map['id'] as String?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      imageUri: map['imageUri'] as String?,
      status: (map['status'] == 'READ'
          ? NotificationStatus.READ
          : NotificationStatus.UNREAD) as NotificationStatus?,
      createdAt: convertDateFromMillisecondsString(map['createdAt'] as String?),
      updatedAt: convertDateFromMillisecondsString(map['updatedAt'] as String?),
      accountId: map['accountId'] as String?,
      account: map['account'] != null
          ? AccountModel.fromJson(map['account'] ?? {})
          : null,
    );
  }
}
