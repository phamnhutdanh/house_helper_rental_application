import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/customer.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class CustomerAddressModel extends CustomerAddress {
  CustomerAddressModel({
    required super.id,
    required super.addressType,
    required super.address,
    required super.customer,
  });

  factory CustomerAddressModel.fromJson(Map<String, dynamic> map) {
    return CustomerAddressModel(
      id: map['id'] as String,
      addressType: map['addressType'] == 'DEFAULT'
          ? AddressType.DEFAULT
          : AddressType.NONE,
      customer: Customer(
        id: map['customer']['id'] as String,
        phoneNumber: map['customer']['id'] as String,
        name: map['customer']['name'] as String,
        imageUri: map['customer']['imageUri'] as String,
      ),
      address: Address(
        id: map['address']['id'] as String,
        address: map['address']['address'] as String,
        fullName: map['address']['fullName'] as String,
        phone: map['address']['phone'] as String,
      ),
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
