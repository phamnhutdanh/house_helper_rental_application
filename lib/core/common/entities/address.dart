import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class Address {
  final String? id;
  final String? address;
  final String? fullName;
  final String? phone;

  Address({
    this.id,
    this.address,
    this.fullName,
    this.phone,
  });
}

class CustomerAddress {
  final String? id;
  final AddressType? addressType;
  final String? customerId;
  final String? addressId;

  CustomerAddress({
    this.id,
    this.addressType,
    this.customerId,
    this.addressId,
  });
}

class EmployeeAddress {
  final String? id;
  final AddressType? addressType;
  final String? employeeId;
  final String? addressId;

  EmployeeAddress({
    this.id,
    this.addressType,
    this.employeeId,
    this.addressId,
  });
}
