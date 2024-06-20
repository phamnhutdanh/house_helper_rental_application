import 'package:house_helper_rental_application/core/common/entities/address.dart';

class Customer {
  final String? id;
  final String? name;
  final String? phoneNumber;
  final String? imageUri;
  final String? accountInfoId;
  final List<CustomerAddress>? customerAddresses;

  Customer({
    this.id,
    this.name,
    this.phoneNumber,
    this.imageUri,
    this.accountInfoId,
    this.customerAddresses,
  });
}
