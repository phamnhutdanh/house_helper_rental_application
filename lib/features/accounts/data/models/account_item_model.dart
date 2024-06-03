import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class AccountItemModel extends AccountInfo {
  AccountItemModel({
    required super.id,
    required super.email,
    required super.accountRole,
    required super.status,
    required super.name,
    required super.imageUri,
  });

  factory AccountItemModel.fromJson(Map<String, dynamic> map) {
    return AccountItemModel(
      id: map['id'] as String,
      email: map['email'] as String,
      accountRole: map['accountRole'] == 'ADMIN'
          ? AccountInfoRole.ADMIN
          : map['accountRole'] == 'CUSTOMER'
              ? AccountInfoRole.CUSTOMER
              : AccountInfoRole.EMPLOYEE,
      status: map['status'] == 'NONE'
          ? AccountStatus.NONE
          : map['status'] == 'WARNING'
              ? AccountStatus.WARNING
              : AccountStatus.BANNED,
      imageUri: map['accountRole'] == 'EMPLOYEE'
          ? map['employee']['imageUri']
          : map['customer']['imageUri'],
      name: map['accountRole'] == 'EMPLOYEE'
          ? map['employee']['name']
          : map['customer']['name'],
    );
  }

  AccountItemModel copyWith({
    String? id,
    String? email,
    AccountInfoRole? accountRole,
    AccountStatus? status,
    String? name,
    String? imageUri,
  }) {
    return AccountItemModel(
      id: id ?? this.id,
      email: email ?? this.email,
      accountRole: accountRole ?? this.accountRole,
      status: status ?? this.status,
      name: name ?? this.name,
      imageUri: imageUri ?? this.imageUri,
    );
  }
}