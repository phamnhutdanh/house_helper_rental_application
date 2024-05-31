import 'package:house_helper_rental_application/core/common/entities/address.dart';
import 'package:house_helper_rental_application/core/common/entities/enum_type.dart';

class CustomerAddressModel extends CustomerAddress {
  CustomerAddressModel({
    required super.id,
    required super.addressType,
    required super.customerId,
    required super.addressId,
  });

  factory CustomerAddressModel.fromJson(Map<String, dynamic> map) {
    return CustomerAddressModel(
      id: map['id'] as String,
      addressType: map['addressType'] == 'DEFAULT'
          ? AddressType.DEFAULT
          : AddressType.NONE,
      customerId: map['customerId'] as String,
      addressId: map['addressId'] as String,
    );
  }

  CustomerAddressModel copyWith({
    String? id,
    AddressType? addressType,
    String? customerId,
    String? addressId,
  }) {
    return CustomerAddressModel(
      id: id ?? this.id,
      addressType: addressType ?? this.addressType,
      customerId: customerId ?? this.customerId,
      addressId: addressId ?? this.addressId,
    );
  }
}
