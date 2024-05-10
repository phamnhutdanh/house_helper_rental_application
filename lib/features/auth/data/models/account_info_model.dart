import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';

class AccountInfoModel extends AccountInfo {
  AccountInfoModel({
    required super.id,
    required super.email,
    required super.accountRole,
    required super.createdAt,
    required super.updatedAt,
    required super.status,
  });

  factory AccountInfoModel.fromJson(Map<String, dynamic> map) {
    return AccountInfoModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      accountRole: map['accountRole'] == 'ADMIN'
          ? AccountInfoRole.ADMIN
          : map['accountRole'] == 'CUSTOMER'
              ? AccountInfoRole.CUSTOMER
              : AccountInfoRole.EMPLOYEE,
      createdAt: convertDateFromMillisecondsString(map['createdAt']),
      updatedAt: convertDateFromMillisecondsString(map['updatedAt']),
      status: map['status'] == 'NONE'
          ? AccountStatus.NONE
          : map['status'] == 'WARNING'
              ? AccountStatus.WARNING
              : AccountStatus.BANNED,
    );
  }

  AccountInfoModel copyWith({
    String? id,
    String? email,
    AccountInfoRole? accountRole,
    DateTime? createdAt,
    DateTime? updatedAt,
    AccountStatus? status,
  }) {
    return AccountInfoModel(
      id: id ?? this.id,
      email: email ?? this.email,
      accountRole: accountRole ?? this.accountRole,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
    );
  }
}
