import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';
import 'package:house_helper_rental_application/features/address/data/models/address_model.dart';
import 'package:house_helper_rental_application/features/customers/data/models/customer_model.dart';

class CustomerAddressModel extends CustomerAddress {
  CustomerAddressModel({
    super.id,
    super.addressType,
    super.address,
    super.customer,
  });

  factory CustomerAddressModel.fromJson(Map<String, dynamic> map) {
    return CustomerAddressModel(
      id: map['id'] as String?,
      addressType: (map['addressType'] == 'DEFAULT'
          ? AddressType.DEFAULT
          : AddressType.NONE) as AddressType?,
      customer: CustomerModel.fromJson(map['customer'] ?? {}),
      address: AddressModel.fromJson(map['address'] ?? {}),
    );
  }

  CustomerAddressModel copyWith({
    String? id,
    AddressType? addressType,
    Customer? customer,
    Address? address,
  }) {
    return CustomerAddressModel(
      id: id ?? this.id,
      addressType: addressType ?? this.addressType,
      customer: customer ?? this.customer,
      address: address ?? this.address,
    );
  }
}
