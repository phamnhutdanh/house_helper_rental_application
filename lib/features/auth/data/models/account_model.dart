import 'package:house_helper_rental_application/core/common/entities/account_info.dart';
import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/core/utils/format_date.dart';
import 'package:house_helper_rental_application/features/customers/data/models/customer_model.dart';
import 'package:house_helper_rental_application/features/employees/data/models/employee_model.dart';

class AccountModel extends AccountInfo {
  AccountModel({
    super.id,
    super.email,
    super.accountRole,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.customer,
    super.employee,
  });

  factory AccountModel.fromJson(Map<String, dynamic> map) {
    return AccountModel(
      id: map['id'] as String?,
      email: map['email'] as String?,
      accountRole: (map['accountRole'] == 'ADMIN'
          ? AccountInfoRole.ADMIN
          : map['accountRole'] == 'CUSTOMER'
              ? AccountInfoRole.CUSTOMER
              : AccountInfoRole.EMPLOYEE) as AccountInfoRole?,
      status: (map['status'] == 'NONE'
          ? AccountStatus.NONE
          : map['status'] == 'WARNING'
              ? AccountStatus.WARNING
              : AccountStatus.BANNED) as AccountStatus?,
      createdAt: convertDateFromMillisecondsString(map['createdAt'] as String?),
      updatedAt: convertDateFromMillisecondsString(map['updatedAt'] as String?),
      customer: map['accountRole'] == 'CUSTOMER'
          ? CustomerModel.fromJson(map['customer'] ?? {})
          : null,
      employee: map['accountRole'] == 'EMPLOYEE'
          ? EmployeeModel.fromJson(map['employee'] ?? {})
          : null,
    );
  }

  AccountModel copyWith({
    String? id,
    String? email,
    AccountInfoRole? accountRole,
    AccountStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Customer? customer,
    Employee? employee,
  }) {
    return AccountModel(
      id: id ?? this.id,
      email: email ?? this.email,
      accountRole: accountRole ?? this.accountRole,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      customer: customer ?? this.customer,
      employee: employee ?? this.employee,
    );
  }
}
