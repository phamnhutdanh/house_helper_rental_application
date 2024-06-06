import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class AccountItemModel extends AccountInfo {
  AccountItemModel({
    super.id,
    super.email,
    super.accountRole,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.customer,
    super.employee,
  });

  factory AccountItemModel.fromJson(Map<String, dynamic> map) {
    return AccountItemModel(
      id: map['id'] as String? ?? '',
      email: map['email'] as String? ?? '',
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
      customer: map['accountRole'] == 'CUSTOMER'
          ? Customer(
              id: map['customer']['id'] as String,
              name: map['customer']['name'] as String,
              imageUri: map['customer']['imageUri'] as String,
              phoneNumber: map['customer']['phoneNumber'] as String? ?? '',
            )
          : null,
      employee: map['accountRole'] == 'EMPLOYEE'
          ? Employee(
              id: map['employee']['id'] as String,
              name: map['employee']['name'] as String,
              imageUri: map['employee']['imageUri'] as String,
              phoneNumber: map['employee']['phoneNumber'] as String?  ?? '',
            )
          : null,
    );
  }

  AccountItemModel copyWith({
    String? id,
    String? email,
    AccountInfoRole? accountRole,
    AccountStatus? status,
    Customer? customer,
    Employee? employee,
  }) {
    return AccountItemModel(
      id: id ?? this.id,
      email: email ?? this.email,
      accountRole: accountRole ?? this.accountRole,
      status: status ?? this.status,
      customer: customer ?? this.customer,
      employee: employee ?? this.employee,
    );
  }
}
