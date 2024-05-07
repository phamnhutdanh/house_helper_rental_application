import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class Address {
  final String id;
  final String address;

  Address({
    required this.id,
    required this.address,
  });
}

class CustomerAddress {
  final String id;
  final AddressType addressType;
  final String customerId;
  final String addressId;

  CustomerAddress({
    required this.id,
    required this.addressType,
    required this.customerId,
    required this.addressId,
  });
}

class EmployeeAddress {
  final String id;
  final AddressType addressType;
  final String employeeId;
  final String addressId;

  EmployeeAddress({
    required this.id,
    required this.addressType,
    required this.employeeId,
    required this.addressId,
  });
}
