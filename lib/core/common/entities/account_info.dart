import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/core/common/entities/employee.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class AccountInfo {
  final String? id;
  final String? email;
  final AccountInfoRole? accountRole;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final AccountStatus? status;
  final Customer? customer;
  final Employee? employee;

  AccountInfo({
    this.id,
    this.email,
    this.accountRole,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.customer,
    this.employee,
  });
}

class EmployeeAccountRequest {
  final String? id;
  final String? name;
  final String? email;
  final String? hashPassword;
  final String? keyPassword;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final EmployeeAccountStatus? status;

  EmployeeAccountRequest({
    this.id,
    this.name,
    this.email,
    this.hashPassword,
    this.keyPassword,
    this.createdAt,
    this.status,
    this.updatedAt,
  });
}
